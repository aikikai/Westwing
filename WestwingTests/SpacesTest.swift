//
//  SpacesTest.swift
//  Westwing
//
//  Created by Luciano Wehrli on 6/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import XCTest
@testable import Westwing

class SpacesTest: XCTestCase {
    
    var sp : Space!
    let testDict : Dictionary<String, AnyObject> = ["name":"Lucho", "subline":"subline", "end_time_formatted":"end time", "description":"description", "navigation_url":"image url", "images": ["banner":["url":"https://static.westwing.de/c/c-die-moderne-kueche2-05131-ml.jpg", "height":"60", "width":"40"]]]
    
    static let name = "Lucho"
    static let subline = "subline"
    static let end_time_formatted = "end time"
    static let descriptionText = "description"
    static let navigation_url = "image url"
    
    override func setUp() {
        super.setUp()
        sp = Space(content: testDict)
    }
    
    override func tearDown() {
        sp = nil
        super.tearDown()
    }
    
    func testSpaceWithCorrectData(){
        XCTAssertEqual(sp.name, SpacesTest.name, "Name was not assigned.")
        XCTAssertEqual(sp.subline, SpacesTest.subline, "Subline was not assigned.")
        XCTAssertEqual(sp.end_time, SpacesTest.end_time_formatted, "End Time was not assigned.")
        XCTAssertEqual(sp.description, SpacesTest.descriptionText, "Description was not assigned.")
        XCTAssertNotNil(sp.bannerImage, "Image banner was nil")
    }
    
}
