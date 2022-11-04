//
//  WelcomeUserTests.swift
//  57-problems-coding-skillsTests
//
//  Created by Ahmad medo on 04/11/2022.
//

import XCTest

@testable import _7_problems_coding_skills

final class WelcomeUserTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    
    func test_WelcomeNewUser_WhenEnterEmptyName_ThrowsEmptyInput() throws{
        let input = ""
        do{
            try WelcomeNewUser(input)
            XCTFail()
        }catch let error{
            XCTAssertEqual(error as! SomeError, SomeError.emptyInput)
        }
        
    }
    
    func test_WelcomeUser() throws{
        let input = "Mido"
        let welcomeUser = try WelcomeNewUser(input)
        
        XCTAssertEqual(welcomeUser, "Hello, \(input), nice to meet you!")
    }

}
