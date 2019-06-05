//  populateEntrant.swift
//  AmusementPark
//  Created by Andrea Salazar Santos on 5/7/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//
import GameKit
import Foundation
func randomName() -> [String] {
    let firstName: [String] = [
        "Andrea",
        "Paulo",
        "Raul",
        "Jesus",
        "Gaby",
        "Alex",
        "Celia",
        "Poncho"]
    
    let lastName:[String] = [
        "Santos",
        "Salazar",
        "Sanchez",
        "Gomez",
        "Gonzalez",
        "Valensuela",
        "Buton",
        "Hoper",
        "Turing",
    ]
    let first = firstName.shuffled()
    let last = lastName.shuffled()
    return [first[0], last[0]]
}
func randomProjectNumber() -> String {
    let randomNumber = Int.random(in: 1000...9999)
    return String(randomNumber)
}
func randomDate() -> String {
    let month = Int.random(in: 1...12)
    var day = 0
    switch month {
    case 1,3,5,7,8,10,12: day = Int.random(in: 1...31)
    case 2: day = Int.random(in: 1...28)
    default: day = Int.random(in: 1...30)
    }
    let components = DateComponents(year:2019, month: month, day:day)
    let calendar = Calendar(identifier: .gregorian)
    guard let date = calendar.date(from: components) else {return ""}
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    let formattedText = formatter.string(from: date)
    return formattedText
}

func randomAddress()->[String]{
    return [
        "\(Int.random(in: 0 ..< 100)) Steet Road",
        "random city \(Int.random(in: 0 ..< 100))",
        "random State \(Int.random(in: 0 ..< 100))",
        "\(Int.random(in: 10000 ..< 99999))"]
}

func randomCompanyName() -> String {
    let vendorNames = [ "acme","nw electrical","fedex","orkin","randomCompany","Treehouse" ]
    let randomIndex = Int.random(in: 0...vendorNames.count - 1)
    return vendorNames[randomIndex]
}


//Causing code to crash string is displayed correctly
//However durring debugging... the value reads as
//    08//10//51 with multiple //
//    var randomDate = ""
//    if month < 10 && day < 10 {
//        randomDate = "0\(month)\\0\(day)\\2019"
//    }
//    else if month < 10 && day > 10 {
//        randomDate = "0\(month)\\\(day)\\2019"
//    }
//    else if month > 10 && day < 10 {
//        randomDate = "\(month)\\0\(day)\\2019"
//    }
//    else {
//        randomDate = "\(month)\\\(day)\\2019"
//    }
//    print(randomDate)
