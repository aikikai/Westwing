//
//  RequestTest.swift
//  Westwing
//
//  Created by Luciano Wehrli on 6/4/16.
//  Copyright © 2016 Luciano Wehrli. All rights reserved.
//

import XCTest
@testable import Westwing

class RequestTest: XCTestCase {
    var spaceArray : [Space]!
    var expectation : XCTestExpectation!

    
    override func setUp() {
        super.setUp()
        self.spaceArray = [Space]()
    }
    
    override func tearDown() {
        self.spaceArray = nil
        super.tearDown()
    }

    func testSpaceArrayNotNil(){
        XCTAssertNotNil(self.spaceArray, "Space array could not be initialized")
    }
    
    func testAsyncRequest(){
        expectation = self.expectationWithDescription("foo")
        APIRequest().fetchData { (ar) -> Void in
            self.spaceArray = ar
            if ar.isEmpty{
                XCTFail("Unexpected response")
            }else{
                XCTAssertEqual(ar.first?.end_time, "Fr, 08.04.") //I am testing this by using the same json file. Then it could be changed with some more customized file.
            }
            self.expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
