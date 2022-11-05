//
//  problem03.swift
//  57-problems-coding-skills
//
//  Created by Ahmad medo on 04/11/2022.
//

import Foundation

@discardableResult
func numOfChars(_ input: String) throws -> String{
    guard !input.isEmpty else{
        print("please enter something")
        throw SomeError.emptyInput
    }
    
    let range = NSRange(location: 0, length: input.count)
    
    let regex = try! NSRegularExpression(pattern: "[0-9]")
                        
                        
    var inputCount = 0
    for char in input{
        inputCount += 1
    }
    
    return "\(input) has \(inputCount) characters"
    
}
