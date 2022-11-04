//
//  Problem1Test.swift
//  57-problems-coding-skillsTests
//
//  Created by Ahmad medo on 04/11/2022.
//

import XCTest

@testable import _7_problems_coding_skills

final class Problem1Test: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {}
    
    func test_TipCalculator_WhenUseCharacter_throwsError() throws {
        
        let tipCalculator = try? TipCalculator(billAmount: "a", tipRate: "b")
        
        XCTAssertNil(tipCalculator)
    }
    
    func test_TipCalculator_WhenUseCharacter_throwsWrongInput() throws {
        
        do{
            try TipCalculator(billAmount: "a", tipRate: "b")
        }catch let error{
            XCTAssertEqual(error as! SomeError, SomeError.wrongInput)
        }
    }
    func test_TipCalculator_WhenUseNegativeNum_throwsNegativeNumberError() throws {
        
        do{
            try TipCalculator(billAmount: "-1", tipRate: "-2")
        }catch let error{
            XCTAssertEqual(error as! SomeError, SomeError.negativeNumber)
        }
    }
    
    func test_TipCalculator_GetsTip_GetsTotal() throws{
        
        let tipCalculator = try TipCalculator(billAmount: "11.25", tipRate: "15")
        
        XCTAssertEqual(tipCalculator?.getTip(), 1.69)
        XCTAssertEqual(tipCalculator?.getTotal(), 12.94)
        
    }
    
}
