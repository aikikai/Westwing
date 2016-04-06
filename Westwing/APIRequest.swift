//
//  APIRequest.swift
//  Westwing
//
//  Created by Luciano Wehrli on 4/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import Foundation

class APIRequest {
    
    func fetchData (completion: (jsonData: [Space]) -> Void) {
//        let delay = 2.5 * Double(NSEC_PER_SEC)
//        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
//        dispatch_after(time, dispatch_get_main_queue()) {
//            var result = Array<Dictionary<String, String>>()
//                result.append(["key":"uno"])
//                result.append(["key":"dos"])
//                result.append(["key":"tres"])
//                result.append(["key":"cuatro"])
//                result.append(["key":"cinco"])            
//            completion(jsonData: result)
//        }
        
        guard let URL = NSURL(string: URL_JSON) else { return }
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL) { (data, response, error) -> Void in
            guard error == nil && data != nil  else {
                print("Failed to download data from the site.")
                return
            }
            do {
                if case let dictionaries as [Dictionary<String, AnyObject>] = try NSJSONSerialization.JSONObjectWithData(data!, options: []) {
                    var spaceArray = [Space]()
                    var space : Space!
                    
                    for var spaceTemp in dictionaries{
                        space = Space(content: spaceTemp)
                        spaceArray.append(space)
                    }
                                        
                    completion(jsonData: spaceArray)
                }
            } catch {
                print("Unexpected data format provided by server.")
            }
        }
        task.resume()
    }
    
}
