//
//  PR000-Bonus\.swift
//  57-problems-coding-skills
//
//  Created by magdy khalifa on 16/11/2022.
//

import Foundation


struct TestingData{
    
    //  "abcdefghijklmnopqrstuvwxyz"
    
    func produceCharWithIndices(alpha: String)->[Int : String]{
        
        var alphaDict: [Int : String] = [:]
        
        for (index, char) in alpha.enumerated(){
            alphaDict[index] = String(char)
        }
        
        return alphaDict
        
    }
    
    func produceChars(alpha: String)->[String : Int]{
        
        var alphaDict: [String : Int] = [:]
        
        for (index, char) in alpha.enumerated(){
            alphaDict[String(char)] = index
        }
        
        return alphaDict
    }
    
    func findCharWithIndex(index: Int, cryptoString: String, shifting: Int)-> String?{
        // our alphabet as [0 : "a" ]
        let alphabetWithIndex = produceCharWithIndices(alpha: cryptoString)
        
        // lastindex --> if incomingIndex > lastindex --> incomingIndex - last
        let count = alphabetWithIndex.count
        
        let remainder = shifting > count ? shifting % count : shifting
        
//        let newShift = remainder
        
        let properIndex = (index + remainder) >= count ? (index - count) : index
        
        return alphabetWithIndex[(properIndex + shifting)]
    }
    
    func encryptText(text: String, cryptoString: String, shifting: Int) -> String{
        
        // get chars of input
        let inputChars = text.map({ $0 })
        
        // standard alphabet as (char & index) [ "a" : 0 ]
        let alphabetAsDict: [String : Int] = produceChars(alpha: cryptoString)
        
        // each index found in alphabet dict
        let indicesFound = inputChars.map({
            alphabetAsDict[String($0)]
        }).filter({
            $0 != nil
        })
        
        // list of chars
        let charsFound: [String?] = indicesFound.map({
            index in
            guard let newIndex = index else{ return nil}
            return findCharWithIndex(index: newIndex, cryptoString: cryptoString ,shifting: shifting)
        }).filter({ $0 != nil})
        
        // result
        var chars = String()
        
        for char in charsFound{
            if let char = char{
                chars += char
            }
        }
        
        return chars.count > 0 ? chars : "error"
    }
    
//
//    func findCharWithIndexDecrypting(index: Int, cryptoString: String, shifting: Int)-> String?{
//        // our alphabet as [0 : "a" ]
//        let alphabetWithIndex = produceCharWithIndices(alpha: cryptoString)
//
//        // lastindex --> if incomingIndex > lastindex --> incomingIndex - last
//        let count = alphabetWithIndex.count
//
//        let properIndex = (index + shifting) >= count ? (index - count) : index
//
//        return alphabetWithIndex[(properIndex + shifting)]
//    }
//
//    func decryptText(text: String, cryptoString: String, shifting: Int) -> String{
//
//        // get chars of input
//        let inputChars = text.map({ $0 })
//
//        // standard alphabet as (char & index) [ "a" : 0 ]
//        let alphabetAsDict: [String : Int] = produceChars(alpha: cryptoString)
//
//        // each index found in alphabet dict
//        let indicesFound = inputChars.map({
//            alphabetAsDict[String($0)]
//        }).filter({
//            $0 != nil
//        })
//
//        // list of chars
//        let charsFound: [String?] = indicesFound.map({
//            index in
//            guard let newIndex = index else{ return nil}
//
//            return findCharWithIndexDecrypting(index: newIndex, cryptoString: cryptoString ,shifting: shifting)
//
//
//        }).filter({ $0 != nil})
//
//        // result
//        var chars = String()
//
//        for char in charsFound{
//            if let char = char{
//                chars += char
//            }
//        }
//
//        return chars
//    }
}

