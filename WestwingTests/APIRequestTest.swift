//
//  APIRequestTest.swift
//  Westwing
//
//  Created by Luciano Wehrli on 13/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import XCTest
@testable import Westwing

class APIRequestTest: XCTestCase {
    var api : APIRequest!
    var completionInvoked = false
    
    override func setUp() {
        super.setUp()
        api = APIRequest()
    }
    
    override func tearDown() {
        api = nil
        super.tearDown()
    }
    
    func testParseServerDataDoesntCallCompletionWithBrokenJSON() {
        let brokenJsonData = "{".dataUsingEncoding(NSUTF8StringEncoding)
        api.completionLocal = fakeCompletion
        api.parseServerData(brokenJsonData, response: nil, error: nil)
        XCTAssertFalse(completionInvoked, "Completion closure must not be called with broken JSON data")
    }
    
    func testParseServerDataCompletionWithProperJSON(){
        let testDict = "[{\"name\":\"Lucho\", \"subline\":\"subline\",\"end_time_formatted\":\"end time\",\"description\":\"description\",\"navigation_url\":\"image url\",\"images\": {\"banner\":{\"url\":\"https://static.westwing.de/c/c-die-moderne-kueche2-05131-ml.jpg\", \"height\":\"60\", \"width\":\"40\"}}}]".dataUsingEncoding(NSUTF8StringEncoding)
    
        api.completionLocal  = fakeCompletion
        api.parseServerData(testDict, response: nil, error: nil)
        XCTAssertTrue(completionInvoked, "Completion closure must be calles with proper JSON data.")
    }
    
    func fakeCompletion(jsonData: [Space]) -> Void{
        completionInvoked = true
    }
}
