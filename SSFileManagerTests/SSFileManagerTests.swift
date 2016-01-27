//
//  SSFileManagerTests.swift
//  SSFileManagerTests
//
//  Created by dulingkang on 16/1/26.
//  Copyright © 2016年 Shawn. All rights reserved.
//

import XCTest
import SSFileManager

class SSFileManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print(kCachesPath())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testCachePath() {
        let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        XCTAssertEqual(path, kCachesPath())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
