//
//  ViewController.swift
//  CodeTest
//
//  Created by Work on 13/02/2016.
//  Copyright © 2016 Work. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var demographicDataArray:[DemographicData] = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 180.0
        
        DataFetcher.sharedInstance.fetchDemographicData { (data) -> Void in
            self.demographicDataArray = data
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            });
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.demographicDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: DemographicCell = tableView.dequeueReusableCellWithIdentifier("DemographicCell", forIndexPath: indexPath) as! DemographicCell

        cell.zipCodeLabel.text = ""
        cell.nameLabel.text = ""
        cell.averageLabel.text = ""
        
        if let data: DemographicData = self.demographicDataArray[indexPath.row] {
            if let zipCode = data.zipCode {
                cell.zipCodeLabel.text = "\(zipCode)"
            }
            if let name = data.name {
                cell.nameLabel.text = name
            }
            if let average = data.average {
                cell.averageLabel.text = "\(average)"
            }
        }
        return cell
    }
}




