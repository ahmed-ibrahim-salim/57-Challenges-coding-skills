//
//  P04MadLib.swift
//  57-problems-coding-skills
//
//  Created by magdy khalifa on 06/11/2022.
//

import Foundation


enum Field: String, CaseIterable{
    case noun
    case verb
    case adjective
    case adverb
}

func readFromTerminal(){
        
    var fields: Array<[Field : String]> = Field.allCases.map({
        field in
    
        print("Enter a \(field): ", terminator: "")
        let readLine = readLine()
        
        return [field : readLine!]
    })
    
    let fieldsValues = fields.map({ $0.values.first! })
    
    print("Do you \(fieldsValues[1]) your \(fieldsValues[2]) \(fieldsValues[0]) \(fieldsValues[3])? That's hilarious!")
    
}

//readFromTerminal()
