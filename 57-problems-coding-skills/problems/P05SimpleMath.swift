//
//  P05SimpleMath.swift
//  57-problems-coding-skills
//
//  Created by magdy khalifa on 06/11/2022.
//

import Foundation

enum SimpleMathField: String, CaseIterable{
    case first
    case second
}

func simpleMath() {
    
    let cases = SimpleMathField.allCases
    
    let nums: [Int] = cases.map({
        simpleMathField in
        
        print("What is the \(simpleMathField) number? ", terminator: "")
        let input = readLine()
        
        guard let input = input, let inputAsInt = Int(input), inputAsInt >= 0 else{
            print("please enter numbers only ?")
            return 0
            
//            throw SomeError.wrongInput
        }
        return inputAsInt
    })
    
    let addition = nums.reduce(0){ $0 + $1 }
    let substract: Int = {
        var finalresult = nums[0]
        for index in (1..<nums.count){
            finalresult -= nums[index]
        }
        return finalresult
    }()
    
    let multiplication = nums.reduce(1){ $0 * $1 }
    let dividing = {
        var finalresult = nums[0]
        for index in (1..<nums.count){
            finalresult /= nums[index]
        }
        return finalresult
    }()

    print(" \(addition)\n \(substract)\n \(multiplication)\n \(dividing)\n")
}

//simpleMath()
