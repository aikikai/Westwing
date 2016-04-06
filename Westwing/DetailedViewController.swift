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
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!

    var currentSpace : Space?
    var currentImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 48.0/255, green: 180.0/255, blue: 150.0/255, alpha: 1.0)
        
        if let localSpace = currentSpace{
            self.name.text = localSpace.name
            self.subline.text = localSpace.subline
            self.url.text = localSpace.navigation_url
            self.bannerImage.image = currentImage
            self.startTime.text = localSpace.end_time

            let descriptionPoint = self.url.frame.origin.y + self.url.frame.size.height + 15
            var descriptionLabel = UITextView(frame: CGRectMake(self.url.frame.origin.x, descriptionPoint, UIScreen.mainScreen().bounds.size.width-(self.url.frame.origin.x*2), 100))
            descriptionLabel.text = localSpace.description
            setTextViewStyles(&descriptionLabel)
            self.scrollContentView.addSubview(descriptionLabel)

            let totalHeight = descriptionLabel.frame.origin.y + descriptionLabel.bounds.size.height
            let size = CGSize(width: self.scrollView.frame.size.width, height: totalHeight + 64)
            self.scrollContentView.frame = CGRectMake(self.scrollContentView.frame.origin.x, self.scrollContentView.frame.origin.y, self.scrollContentView.frame.size.width, size.height)
            self.scrollView.contentSize = size
            self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0)
        }
    }
    
    

    func setTextViewStyles(inout descriptionLabel:UITextView){
        descriptionLabel.textContainerInset = UIEdgeInsetsZero;
        descriptionLabel.textContainer.lineFragmentPadding = 0;
        
        let fixedWidth = descriptionLabel.frame.size.width
        descriptionLabel.sizeToFit()
        descriptionLabel.scrollEnabled = false
        let newSize = descriptionLabel.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = descriptionLabel.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        descriptionLabel.frame = newFrame;
    }
    
    
    //MARK: Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
