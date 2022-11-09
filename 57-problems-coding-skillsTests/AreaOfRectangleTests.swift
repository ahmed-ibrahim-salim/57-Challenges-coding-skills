//
//  AreaOfRectangleTests.swift
//  57-problems-coding-skillsTests
//
//  Created by magdy khalifa on 08/11/2022.
//

import XCTest

@testable import _7_problems_coding_skills

final class AreaOfRectangleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ChooseUnit_ReturnsCorrectUnit() throws{
        let sut = TestClass()
        
        // chooseing meters
        let unit = try sut.chooseUnit(feetOrMeters: "1")
        
        XCTAssertEqual(unit, Unit.feet)
    }
    
    func test_ChooseUnit_WhenPassWrongNum_ReturnsNil() throws{
        let sut = TestClass()
        
        // chooseing meters
        let unit = try sut.chooseUnit(feetOrMeters: "2")
        
        XCTAssertNil(unit)
    }
    
}
