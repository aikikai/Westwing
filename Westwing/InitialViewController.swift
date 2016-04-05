//
//  InitialViewController.swift
//  Westwing
//
//  Created by Luciano Wehrli on 4/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {
    
    let activity = UIActivityIndicatorView(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height))
    
    var isLoading : Bool{
        get{
            return self.isLoading
        }
        set(newValue){
            if newValue{
                self.activity.startAnimating()
                self.activity.alpha = 1.0
            }else{
                self.activity.stopAnimating()
                self.activity.alpha = 0.0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        setInitialStyles()
        isLoading = true
        
        let APIManager = APIRequest().fetchData { (spaceArray) -> Void in
                self.isLoading = false
                let MainVC = self.storyboard?.instantiateViewControllerWithIdentifier("NavStoryboardId") as! UINavigationController
                MainVC.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                var firstVC = MainVC.viewControllers.first as! MainViewController
                firstVC.spaceArray = spaceArray
                self.navigationController?.presentViewController(MainVC, animated: true, completion: { () -> Void in
                })
                
        }
        
    }

    //MARK: Miscelaneas
    func setInitialStyles(){
        activity.color = UIColor.whiteColor()
        self.view.addSubview(activity)
    }


}
