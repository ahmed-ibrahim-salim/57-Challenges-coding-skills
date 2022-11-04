//
//  P02-HelloWorld.swift
//  57-problems-coding-skills
//
//  Created by Ahmad medo on 04/11/2022.
//

import Foundation


@discardableResult
func WelcomeNewUser(_ input: String) throws -> String{
    
    guard !input.isEmpty else{
        throw SomeError.emptyInput
    }
    
    let range = NSRange(location: 0, length: input.count)
    let regex = try! NSRegularExpression(pattern: "[A-Za-z]")
    guard regex.matches(in: input, range: range).count != 0 else{
        throw SomeError.wrongInput
    }
 
  return "Hello, " + input + ", nice to meet you!"
}

