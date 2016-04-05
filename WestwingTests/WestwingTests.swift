//
//  WestwingTests.swift
//  WestwingTests
//
//  Created by Luciano Wehrli on 4/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import XCTest
@testable import Westwing

class WestwingTests: XCTestCase {
    var testObject : Image!
    let jsonData = ["banner": ["url":"https://static.westwing.de/c/c-die-moderne-kueche2-05131-ml.jpg", "width":"640", "height":"360"] ]
    let emptyJson : Dictionary<String, Dictionary<String, String>> = Dictionary<String, Dictionary<String, String>>()

    static let url = "https://static.westwing.de/c/c-die-moderne-kueche2-05131-ml.jpg"
    static let width = 640
    static let height = 360
    
    
    override func setUp() {
        super.setUp()
        testObject = Image(content: jsonData)
    }
    
    override func tearDown() {
        testObject = nil
        super.tearDown()
    }
    
    
    //return the proper object is I pass the proper dictionary
    func testImageIsInitialicedFromProperDict(){
        XCTAssertNotNil(testObject, "Error when returning image object with correct dict")
    }
    
    func testImageUrlAssignment(){
        XCTAssertEqual(testObject.url, WestwingTests.url, "Url was not assigned.")
    }
    
    
    
}
