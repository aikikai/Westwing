//
//  APIRequest.swift
//  Westwing
//
//  Created by Luciano Wehrli on 4/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import Foundation

class APIRequest {
    
    var completionLocal : ((jsonData: [Space]) -> Void)?
    
    func fetchData (completion: (jsonData: [Space]) -> Void) {
        completionLocal = completion
        guard let URL = NSURL(string: URL_JSON) else { return }
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL, completionHandler: parseServerData)
        task.resume()
    }
    

    func parseServerData(data : NSData?, response: NSURLResponse?, error: NSError?){
        guard error == nil && data != nil else{
            print("Filed downloading data from the site")
            return
        }
        do{
            if case let dictionaries as [Dictionary<String, AnyObject>] = try NSJSONSerialization.JSONObjectWithData(data!, options: []) {
                var spaceArray = [Space]()
                var space : Space!
                
                for var spaceTemp in dictionaries{
                    space = Space(content: spaceTemp)
                    spaceArray.append(space)
                }
                completionLocal?(jsonData: spaceArray)
            }
        }catch _{
            print("Unexpected data format provided by server")
        }
    }
}