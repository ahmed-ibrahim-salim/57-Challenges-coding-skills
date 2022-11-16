//
//  encrypt-decrypt-Bonus-tests.swift
//  57-problems-coding-skillsTests
//
//  Created by magdy khalifa on 16/11/2022.
//

import XCTest

@testable import _7_problems_coding_skills

final class encrypt_decrypt_Bonus_tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_produceCharWithIndices(){
        let testing = TestingData()
        let dict = testing.produceCharWithIndices(alpha: "ab")

        XCTAssertEqual(dict, [ 0 : "a", 1 : "b"])

    }

    func test_produceChars(){
        let testing = TestingData()
        let dict = testing.produceChars(alpha: "ab")

        XCTAssertEqual(dict, [ "a" : 0, "b" : 1])

    }
    func test_findNum13(){
        let testing = TestingData()
        
        let char = testing.findCharWithIndex(index: 12, cryptoString: "abcdefghijklmnopqrstuvwxyz", shifting: 12)
        XCTAssertEqual(char, "y")
        
        let char4 = testing.findCharWithIndex(index: 12, cryptoString: "abcdefghijklmnopqrstuvwxyz", shifting: 13)
        XCTAssertEqual(char4, "z")
        
        let char2 = testing.findCharWithIndex(index: 13, cryptoString: "abcdefghijklmnopqrstuvwxyz", shifting: 13)
        XCTAssertEqual(char2, "a")
        //
        let char3 = testing.findCharWithIndex(index: 14, cryptoString: "abcdefghijklmnopqrstuvwxyz", shifting: 14)
        XCTAssertEqual(char3, "c")

    }
    
    func test_encrypt(){
        let testing = TestingData()

        let encrypted = testing.encryptText(text: "av", cryptoString: "abcdefghijklmnopqrstuvwxyz", shifting: 40)

        XCTAssertEqual(encrypted, "mh")

    }
}
