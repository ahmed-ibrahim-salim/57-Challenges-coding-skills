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
            throw SomeError.wrongInput
        }
        
        guard billAmount >= 0,
              tipRate >= 0 else{
                  throw SomeError.negativeNumber
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


