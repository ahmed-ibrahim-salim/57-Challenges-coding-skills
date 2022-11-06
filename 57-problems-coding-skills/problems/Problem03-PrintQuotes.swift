//
//  Problem03.swift
//  57-problems-coding-skills
//
//  Created by Ahmad medo on 05/11/2022.
//

import Foundation

@discardableResult
func printQuotes(_ quote: String, author: String) throws -> String{
    
    guard !quote.isEmpty, !author.isEmpty else{
        throw SomeError.emptyInput
    }
    
    let regex = try! Regex("[A-Za-z]")
    
    guard !regex.contains(captureNamed: quote),
            !regex.contains(captureNamed: author) else{
        throw SomeError.wrongInput
    }
    
    return "\(author) says, \"\(quote)\""
}
