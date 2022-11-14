//
//  P09PaintCalculator.swift
//  57-problems-coding-skills
//
//  Created by magdy khalifa on 14/11/2022.
//

import Foundation

enum SomeError: String, Error{
    case wrongInput = "please enter proper input! "
    case negativeNumber = "please enter a positive number! "
    case emptyInput = "please enter a value"
}

struct Helper{
    
    func checkInputAsInt(input: String?) throws -> Int{
        guard let num = input, num.count > 0 else{
            print(SomeError.emptyInput.rawValue)
            throw SomeError.emptyInput
        }
        
        guard Int(num) != nil,
                let numAsInt = Int(num) else{
            print(SomeError.wrongInput.rawValue)
            throw SomeError.wrongInput
        }
        
        guard numAsInt > 0 else{
            print(SomeError.negativeNumber.rawValue)
            throw SomeError.negativeNumber
        }
        
        return numAsInt
    }
    
    func checkInputAsDouble(input: String?) throws -> Double{
        
        guard let num = input, num.count > 0 else{
            print(SomeError.emptyInput.rawValue)
            throw SomeError.emptyInput
        }
        
        guard Double(num) != nil,
                let numAsDouble = Double(num) else{
            print(SomeError.wrongInput.rawValue)
            throw SomeError.wrongInput

        }
        guard numAsDouble > 0 else{
            print(SomeError.negativeNumber.rawValue)

            throw SomeError.negativeNumber
        }
        
        return numAsDouble
    }
    
}



func paintCalculator(widthAsNum: Double, heightAsNum: Double) throws -> Double{
    
//    let helper = Helper()
//
//    let width = readLine()
//
//    let widthAsNum = try helper.checkInputAsDouble(input: width)
//
//    let height = readLine()
//
//    let heightAsNum = try helper.checkInputAsDouble(input: height)
    
    let area = widthAsNum * heightAsNum
    
    let gallons = ceil(area / 350)
    
    return gallons
    // one gallon for 350 feet2
    
    
}
//
//do{
//    try paintCalculator()
//}catch{}
