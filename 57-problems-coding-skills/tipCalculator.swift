//
//  Problem1.swift
//  57-problems-coding-skills
//
//  Created by Ahmad medo on 04/11/2022.
//

import Foundation

class TipCalculator{
    
    let billAmount: Double
    let tipRate: Double
    
    @discardableResult
    init?(billAmount: String, tipRate: String) throws{
        
        guard let billAmount = Double(billAmount),
              let tipRate = Double(tipRate)else{
            throw InputError.wrongInput
        }
        
        guard billAmount >= 0,
              tipRate >= 0 else{
                  throw InputError.negativeNumber
        }
        
        self.billAmount = Double(billAmount)
        self.tipRate = Double(tipRate)
        
    }
    
    func getTip() -> Double{
        
        let amount = billAmount * (tipRate / 100)
        return Double(round(amount * 100) / 100)
        
    }
    
    func getTotal() -> Double{
        billAmount + getTip()
    }
    
}

enum InputError: String, Error{
    case wrongInput = "Please enter a number"
    case negativeNumber = "Please enter a negative number"
}

