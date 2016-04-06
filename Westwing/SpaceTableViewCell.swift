//
//  SpaceTableViewCell.swift
//  Westwing
//
//  Created by Luciano Wehrli on 5/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import UIKit

class SpaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!
    var controller : MainViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadImage(link: String?){
        if link != nil, let url = NSURL(string: link!) {
            NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in
                guard let data = data where error == nil else {
                    return
                }
                if let httpResponse = response as? NSHTTPURLResponse where httpResponse.statusCode != 200 {
                    return
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.bannerImage.image = UIImage(data: data)
                    self.controller.imageDict[link!] = self.bannerImage.image
                }
                }.resume()
        } else {
            self.bannerImage.image = UIImage(named: "noimage")
        }
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
    }

}
