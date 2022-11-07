//
//  P06RetirementCalculator.swift
//  57-problems-coding-skills
//
//  Created by magdy khalifa on 07/11/2022.
//

import Foundation


func calculateRetirementAge(){
    
    for i in [0...100]{
        print("What is your current age? ", terminator: "")
        let currentAge = readLine()
        
        guard let currentAge = currentAge, let currentAgeAsInt = Int(currentAge), currentAgeAsInt > 0 else{
            continue
//            return
        }
        
        print("At what age would you like to retire? ", terminator: "")
        let retirementAge = readLine()
        
        guard let retirementAge = retirementAge, let retirementAgeAsInt = Int(retirementAge), retirementAgeAsInt > currentAgeAsInt else{
            continue
//            return
        }
        
        let yearsUntillRetirement = retirementAgeAsInt - currentAgeAsInt
        print("You have \(yearsUntillRetirement) years left until you can retire.")
        
        let currentyear = Calendar(identifier: .gregorian).component(.year, from: Date())
        
        print("It's \(currentyear), so you can retire in \(currentyear + yearsUntillRetirement).")
        break
    }
}

calculateRetirementAge()
