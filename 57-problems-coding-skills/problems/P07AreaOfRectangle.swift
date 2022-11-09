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
        //    print("Enter 0 for unit in meters or 1 for feet unit " , terminator: "")
        //    let feetOrMeters = readLine()
        
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
}
//func calculateAreaOfRectangle() throws {
//
//    guard let unit = try chooseUnit() else{
//        return
//    }
//
//    print("Enter \(Side.width) in \(unit.rawValue) " , terminator: "")
//    let width = readLine()
//
//    guard let width = width, Double(width) != nil,
//            let widthAsDouble = Double(width) else{
//        return
//    }
//
//    print("Enter \(Side.length) in \(unit.rawValue) ", terminator: "")
//    let length = readLine()
//
//    guard let length = length, Double(length) != nil,
//            let lengthAsDouble = Double(length) else{
//        return
//    }
//
//
//    switch unit {
//    case .meter:
//        let areaInMeters = widthAsDouble * lengthAsDouble
//
//        let areaInFeet = (widthAsDouble * lengthAsDouble) / 0.09290304
//        print("Area \(areaInMeters) meters, in Feet \(areaInFeet)")
//    case .feet:
//        let areaInMeters = widthAsDouble * lengthAsDouble
//
//        let areaInFeet = (widthAsDouble * lengthAsDouble) / 0.09290304
//        print("Area \(areaInMeters) meters, in Feet \(areaInFeet)")
//    }
//
//
////    print("Area \(areaInMeters) meters, in Feet \(areaInFeet)")
//}
//
//calculateAreaOfRectangle()
