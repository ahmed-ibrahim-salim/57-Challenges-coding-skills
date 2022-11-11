//
//  P07AreaOfRectangle.swift
//  57-problems-coding-skills
//
//  Created by magdy khalifa on 08/11/2022.
//

import Foundation

enum Side: String, CaseIterable{
    case width
    case length
}

enum Unit: String{
    
    case meter
    case feet
}

struct TestClass{
    
    func chooseUnit(feetOrMeters: String?) throws -> Unit?{
        
        let range = NSRange(location: 0,
                            length: feetOrMeters?.utf16.count ?? 0)
        
        let regex = try NSRegularExpression(pattern: "[0-1]")
        
        guard let unitByNumber = feetOrMeters,
              regex.firstMatch(in: unitByNumber, range: range) != nil
        else{
            return nil
        }
        
        return unitByNumber == "0" ? .meter : .feet
    }
    
    func calculateAreaByUnit(choosenUnit: Unit, width: Double, length: Double) -> (Double, Double){
        
        var area = width * length
        var areaInFeet = area
        var areaInMeters = area
        
        switch choosenUnit {
        case .meter:
            areaInFeet = area / 0.09290304
        case .feet:
            areaInMeters = area * 0.09290304
        }
        //
        var roundedAreaInMeter = areaInMeters.roundNum(numOfFloatingPoints: 5)
        var roundedAreaInFeet = areaInFeet.roundNum(numOfFloatingPoints: 5)
        
        return (roundedAreaInMeter, roundedAreaInFeet)
    }
}

func calculateAreaOfRectangle() throws{
    let testClass = TestClass()
    let helper = Helper()
    
    print("Please enter 0 to use meters or 1 to use feet: ", terminator: "")
    let readUnit = readLine()
    
    guard let unit = try testClass.chooseUnit(feetOrMeters: readUnit) else{
        return
    }
    
    print("Enter \(Side.width) in \(unit.rawValue) " , terminator: "")
    let width = readLine()
    
    let widthAsDouble: Double = try helper.checkInputAsDouble(input: width)
        
    print("Enter \(Side.length) in \(unit.rawValue) ", terminator: "")
    let length = readLine()
    
    let lengthAsDouble: Double = try helper.checkInputAsDouble(input: length)
    
    
    let (areaInMeters, areaInFeet) = testClass.calculateAreaByUnit(choosenUnit: unit, width: widthAsDouble, length: lengthAsDouble)
    
    print("Area \(areaInMeters) meters, in Feet \(areaInFeet)")
}

//do {
//    try calculateAreaOfRectangle()
//}catch{
//    
//}


