//
//  NumOfCharTests.swift
//  57-problems-coding-skillsTests
//
//  Created by Ahmad medo on 04/11/2022.
//

import XCTest
@testable import _7_problems_coding_skills

final class NumOfCharTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_NumOfChars_EmptyInput_ReturnsEmptyInput() throws{
        let input = ""
        do{
            try numOfChars(input)
        }catch let error{
            
            XCTAssertEqual(error as! SomeError , SomeError.emptyInput)
        }
        
    }
    
    func test_NumOfChars_ReturnsCount() throws{
     
        let input = "Honey"
        let result = try numOfChars(input)
        
        XCTAssertEqual(result, "\(input) has \(input.count) characters")
     
        
    }

}
