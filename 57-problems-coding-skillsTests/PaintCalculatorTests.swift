//
//  PaintCalculatorTests.swift
//  57-problems-coding-skillsTests
//
//  Created by magdy khalifa on 14/11/2022.
//

import XCTest
@testable import _7_problems_coding_skills

final class PaintCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Gallons() throws{
        let gallons = try paintCalculator(widthAsNum: 200, heightAsNum: 100)
        
        XCTAssertEqual(gallons, 58)
    }
    
}
