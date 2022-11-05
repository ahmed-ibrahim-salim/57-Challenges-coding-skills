//
//  printQuotesTests.swift
//  57-problems-coding-skillsTests
//
//  Created by Ahmad medo on 05/11/2022.
//

import XCTest
@testable import _7_problems_coding_skills

final class printQuotesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_() throws{
        let author = "Kent Beck"
        
        let quote = "Make it work. make it right, make it fast"
        
        let output = try printQuotes(quote, author: author)
        
        XCTAssertEqual(output, "\(author) says, \"\(quote)\"")
        
    }

}
