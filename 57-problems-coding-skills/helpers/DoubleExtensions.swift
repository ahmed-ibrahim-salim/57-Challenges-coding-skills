//
//  DoubleExtensions.swift
//  57-problems-coding-skills
//
//  Created by Ahmad medo on 11/11/2022.
//

import Foundation

extension Double{
    
    mutating func roundNum(numOfFloatingPoints: Int) -> Self{
        let zeros = "1" + String(repeating: "0", count: numOfFloatingPoints)
        
        guard let zerosAsDouble = Double(zeros) else{
            return 0
        }
        let roundedNum = (self * zerosAsDouble).rounded() / zerosAsDouble
        
        return roundedNum
    }
    
}
