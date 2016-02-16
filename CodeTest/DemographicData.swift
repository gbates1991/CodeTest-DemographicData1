//
//  DemographicData.swift
//  CodeTest
//
//  Created by Work on 16/02/2016.
//  Copyright © 2016 Work. All rights reserved.
//

import UIKit
import JSONCodable

public class DemographicData: NSObject {
    public var zipCode:Int?
    public var name:String?
    public var average:Double?
}

protocol DictSerializable: JSONEncodable {}
extension DictSerializable {
    func toDict() -> [String : AnyObject]? {
        var selfDict: [String : AnyObject]?
        do {
            selfDict = try self.toJSON() as? [String : AnyObject]
            return selfDict
        } catch {
            return nil
        }
    }
    func toParams() -> [String : AnyObject]? {
        return self.toDict()!
    }
}

extension DemographicData: DictSerializable { }
