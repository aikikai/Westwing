//
//  spaces.swift
//  Westwing
//
//  Created by Luciano Wehrli on 5/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import Foundation

class Space {
    var name : String?
    var subline : String?
    var bannerImage : Image?
    var navigation_url : String?
    var end_time : String?
    var description : String?
    
    init(content: Dictionary<String, AnyObject>){
        guard let name = content["name"] as? String else { return }
        guard let subline = content["subline"] as? String else { return }
        guard let end_time = content["end_time_formatted"] as? String else {  return }
        guard let description = content["description"] as? String else { return }
        guard let navigation_url = content["navigation_url"] as? String else { return }
        guard let imagen = content["images"] as? Dictionary<String, Dictionary<String, String>> else { return }
        
        self.name = name
        self.subline = subline
        self.end_time = end_time
        self.description = description
        self.navigation_url = navigation_url
        self.bannerImage = Image(content: imagen)
    }

}