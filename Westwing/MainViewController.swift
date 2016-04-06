//
//  ViewController.swift
//  Westwing
//
//  Created by Luciano Wehrli on 4/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var spaceArray = Array<Space>()
    var imageDict : Dictionary<String, UIImage> = [String : UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

    
    //MARK: TABLEVIEW
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("spaceCellIdentifier", forIndexPath: indexPath) as! SpaceTableViewCell
        cell.title.text = spaceArray[indexPath.row].name
        cell.details.text = spaceArray[indexPath.row].subline
        cell.bannerImage.image = UIImage(named: "noimageicon")
        
        if let url = spaceArray[indexPath.row].bannerImage?.url{
            if imageDict[url] != nil{
                cell.bannerImage.image = imageDict[url]
            }else{
                cell.controller = self
                cell.loadImage(self.spaceArray[indexPath.row].navigation_url)
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88.0
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedIndex = tableView.indexPathForSelectedRow
        tableView.deselectRowAtIndexPath(selectedIndex!, animated: true)
        let destinationVC = segue.destinationViewController as! DetailedViewController
        destinationVC.currentSpace = self.spaceArray[(selectedIndex?.row)!]
        let selectedCell = tableView.cellForRowAtIndexPath(selectedIndex!) as! SpaceTableViewCell
        destinationVC.currentImage = selectedCell.bannerImage.image
    }
    
    //Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}

