//
//  P08PizzaParty.swift
//  57-problems-coding-skills
//
//  Created by Ahmad medo on 11/11/2022.
//

import Foundation



func pizzaParty() throws{
    let helper = Helper()
    print("How many people ? ", terminator: "")
    let people = readLine()

    let peopleAsInt = try helper.checkInputAsInt(input: people)

    print("How many pizzas do you have ? ", terminator: "")
    let pizzas = readLine()

    let pizzasAsInt = try helper.checkInputAsInt(input: pizzas)

    let pizzaPieces = pizzasAsInt * 8

    let piecesForEachPerson = Int(floor(Double(pizzaPieces / peopleAsInt)))

    let remaining = pizzaPieces % peopleAsInt
    var leftOvers = 0

    let pieceOrPiecesForEachPeson = pieceOrpieces(num: piecesForEachPerson)
    let pieceOrPiecesForLeftOver = pieceOrpieces(num: leftOvers)

    if remaining == 0 {
        print("Each person gets \(piecesForEachPerson) \(pieceOrPiecesForEachPeson) of pizza")
        print("There are \(leftOvers) leftover \(pieceOrPiecesForLeftOver).")
    }else{
        leftOvers = remaining
        print("Each person gets \(piecesForEachPerson) pieces of pizza")
        print("There are \(leftOvers) leftover \(pieceOrPiecesForLeftOver).")
    }
}

func pizzaParty2() throws{
    let helper = Helper()
    print("How many people ? ", terminator: "")
    let people = readLine()
    
    let peopleAsInt = try helper.checkInputAsInt(input: people)
    
    print("How many pieces each person needs ? ", terminator: "")
    let piecesInput = readLine()
    
    let piecesAsInt = try helper.checkInputAsInt(input: piecesInput)
    
    let allPieces = piecesAsInt * peopleAsInt
    
    var pizzasNeeded = allPieces / 8

    if allPieces % 8 != 0{
        pizzasNeeded += 1
    }
    
    let pizzaOrPizzas = pizzasNeeded > 1 ? "pizzas" : "pizza"
    print("we need \(pizzasNeeded) \(pizzaOrPizzas)")
}


func pieceOrpieces(num: Int)-> String{
    return num > 1 ? "pieces" : "piece"
}

//do{
//    try pizzaParty()
////    try pizzaParty2()
//    
//}catch{
//    
//}
