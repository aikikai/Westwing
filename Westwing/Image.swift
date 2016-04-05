//
//  Images.swift
//  Westwing
//
//  Created by Luciano Wehrli on 5/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import Foundation

class Image {
    var url : String?
    var width : String?
    var height : String?
    
    init?(content: Dictionary<String, Dictionary<String, String>>){
        if let banner = content["banner"]{
            self.url = banner["url"]
            self.width = banner["width"]
            self.height = banner["height"]
        }else{
            self.url = ""
            self.width = ""
            self.height = ""
        }
    }
}