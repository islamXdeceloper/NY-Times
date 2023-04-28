//
//  ResponseTest.swift
//  NY TimesTests
//
//  Created by Islam Ahmed on 27/04/2023.
//

import XCTest
@testable import NY_Times
class ResponseTest: XCTestCase {
    func test_Api_Key_With_EmptyString_Retruns_failure() {
        // ARRANGE
        let api_key = EnvironmentConfigurations.api_key
        
        // ACT
        let result = api_key + " - "
        let url = NYURL.baseUrl + result
        
        // ASSERT
        XCTAssertFalse(url.isEmpty)
    }
}
