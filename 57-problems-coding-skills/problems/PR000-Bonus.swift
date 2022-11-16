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
    
    func findNum13(index: Int, shifting: Int)-> String?{
        // our alphabet as [0 : "a" ]
        let alphabetWithIndex = produceCharWithIndices(alpha: "abcdefghijklmnopqrstuvwxyz")
        
        // lastindex --> if incomingIndex > lastindex --> incomingIndex - last
        let count = alphabetWithIndex.count
        
        let properIndex = (index + shifting) >= count ? (index - count) : index
        
        return alphabetWithIndex[(properIndex + shifting)]
    }
    
    func encryptText(text: String, cryptoString: String, shifting: Int) -> String{
        //        [Int?]
        // get chars of input
        let inputChars = text.map({
            char in
            return char
        })
        
        // standard alphabet as char & index [ "a" : 0 ]
        let alphabetAsDict: [String : Int] = produceChars(alpha: cryptoString)
        
        // each index found in alphabet
        let indicesFound = inputChars.map({
            alphabetAsDict[String($0)]
        }).filter({
            $0 != nil
        })
        
        let charsFound: [String?] = indicesFound.map({
            index in
            guard let newIndex = index else{ return nil}
            return findNum13(index: newIndex, shifting: shifting)
        }).filter({ $0 != nil})
        
        
        var chars = String()
        
        for char in charsFound{
            if let char = char{
                chars += char
            }
        }
        
        return chars
    }
}

