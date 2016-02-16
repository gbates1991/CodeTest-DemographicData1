//
//  DataFetcher.swift
//  CodeTest
//
//  Created by Work on 13/02/2016.
//  Copyright © 2016 Work. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class DataFetcher: NSObject {
    
    static let sharedInstance = DataFetcher()
    private var dataURL:String
    
    public override init() {
        self.dataURL = "https://data.cityofnewyork.us/api/views/kku6-nxdu/columns.json"
    }
    
    private func setDemographicData(json:SwiftyJSON.JSON) -> DemographicData {
        let demoData:DemographicData = DemographicData()
        if let zipCode = json["id"].int {
           demoData.zipCode = zipCode
        }
        if let name = json["name"].string {
            demoData.name = name
        }
        if let cachedContents = json["cachedContents"].dictionary {
            if let average = cachedContents["average"] {
                demoData.average = average.doubleValue
            }
        }
        return demoData
    }
    
    public func fetchDemographicData(completion:((data:[DemographicData])->Void)) {
        Alamofire.request(.GET, self.dataURL, headers: Alamofire.Manager.defaultHTTPHeaders
            , parameters: nil)
            .responseJSON {response in
                let data = response.result.value
                if response.response?.statusCode != 200 {
                    completion(data: [])
                } else {
                    
                    var zipData:[DemographicData] = []
                    for (_, subJson): (String, JSON) in JSON(data!) {
                        if let demoData:DemographicData = self.setDemographicData(subJson) {
                            zipData.append(demoData)
                        }
                    }
                    completion(data: zipData)
                }
        }
    }
}


