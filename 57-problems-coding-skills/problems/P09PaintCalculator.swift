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

protocol AreaCalculator{
    
    func area()->Double
    func gallonsNeeded()->Int
}

struct Rectangle: AreaCalculator{

    var width, height: Double
    
    init(width: Double = 0, height: Double = 0) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
        return width * height
    }
    
    func gallonsNeeded()->Int{
        let area = area()
        return Int(ceil(area / 350))
    }
    
}

struct Circle: AreaCalculator{

    var radius: Double
    
    init(radius: Double = 0) {
        self.radius = radius
    }
    
    func area() -> Double {
        return (Double.pi * radius * radius)
    }
    
    func gallonsNeeded()->Int{
        let area = area()
        
        return Int(ceil(area / 350))
    }
    
}

struct LShaped: AreaCalculator{
    
    var horizontalRectangle, verticalRectangle: Rectangle
    
    init(horizontalShort: Double,
         horizontalLong: Double,
         verticalShort: Double,
         verticalLong: Double){
        
        // 4 sides
        // (short - long) horizontal
        // (short - long) vertical
        
        // horizontal rectangle = [width(short + long horizontal) -- height(short vertical) ]
        let widthForHorizontal = horizontalLong + horizontalShort
        self.horizontalRectangle = Rectangle(width: widthForHorizontal, height: verticalShort)
        
        // vertical rectangle = [width(short horizontal) -- height(short + long vertical) ]
        let heightForRectangle = verticalShort + verticalLong
        self.verticalRectangle = Rectangle(width: verticalShort, height: heightForRectangle)
    }
    
    func area() -> Double {
        let hRectangle = horizontalRectangle.area()
        let vRectangle = verticalRectangle.area()
        
        return hRectangle + vRectangle
    }
    
    func gallonsNeeded()->Int{
        let area = area()
        
        return Int(ceil(area / 350))
    }
}

@discardableResult
func paintCalculator() throws -> Int{
    
    // horizontalShort: Double,
    //horizontalLong: Double,
    //verticalShort: Double,
    //verticalLong: Double
    
    // radius: Double
    
    //widthAsNum: Double, heightAsNum: Double
    
    let helper = Helper()
    var shape: AreaCalculator
    
    // inputs
    print("Please enter 1 for rectangle or 2 for circle ", terminator: "")
    let choice = readLine()
    let choiceAsInt = try helper.checkInputAsInt(input: choice)
    
    shape = try getShapeFromInput(shapeId: choiceAsInt)!
    
    let gallons = shape.gallonsNeeded()
    print("you will need \(gallons) gallons")
    
    return gallons
    
}


func getShapeFromInput(shapeId: Int)throws -> AreaCalculator?{
    let helper = Helper()
//
    if shapeId == 1{
    let shapeLengthes: Array<[String : Double]> = try RectangleSides.allCases.map({
        side in
        print("please enter \(side.rawValue): ", terminator: "")
        let sideLength = readLine()
        let sideAsDouble = try helper.checkInputAsDouble(input: sideLength)
        return [side.rawValue : sideAsDouble]
    })
    
    let shapeLengthesValues = shapeLengthes.map({ $0.values.first! })
    
    
    return Rectangle(width: shapeLengthesValues[0], height: shapeLengthesValues[1])
    
    }
    else if shapeId == 2{
        let shapeLengthes: Array<[String : Double]> = try CircleSides.allCases.map({
            side in
            print("please enter \(side.rawValue)! ", terminator: "")
            let sideLength = readLine()
            let sideAsDouble = try helper.checkInputAsDouble(input: sideLength)
            return [side.rawValue : sideAsDouble]
        })

        let shapeLengthesValues = shapeLengthes.map({ $0.values.first! })

        return Circle(radius: shapeLengthesValues[0])
    }
    else{
        print("please enter proper choice")
    }

    throw SomeError.wrongInput
}

enum RectangleSides: String, CaseIterable{

    case width
    case height
}

enum CircleSides: String, CaseIterable{

    case radius
}

struct ShapesDefiner{
    var sides: [Any]
    
    init?(value: Int, rectangleSides: RectangleSides.AllCases) {
        if value == 1{
            self.sides = rectangleSides
        }else{
            return nil
        }
    }
    
    init?(value: Int, circleSides: CircleSides.AllCases) {
        if value == 1{
            self.sides = circleSides
        }else{
            return nil
        }
    }
}

do{
    try paintCalculator()
}catch{

}
