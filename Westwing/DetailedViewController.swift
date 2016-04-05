//
//  DetailedViewController.swift
//  Westwing
//
//  Created by Luciano Wehrli on 4/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var subline: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var currentSpace : Space?
    var currentImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 48.0/255, green: 180.0/255, blue: 150.0/255, alpha: 1.0)

        if let localSpace = currentSpace{
            self.name.text = localSpace.name
            self.subline.text = localSpace.subline
            self.url.text = localSpace.navigation_url
            self.descriptionLabel.text = localSpace.description
            self.bannerImage.image = currentImage
            self.startTime.text = localSpace.end_time
        }
        
    }

    //MARK: Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
