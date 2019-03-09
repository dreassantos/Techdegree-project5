//  Entrents.swift
//  AmusementPark
//
//  Created by Andrea on 3/2/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.

import Foundation
//Guest Types
enum entrantType {
    case classic
    case vip
    case child
    case foodServiceEmployee
    case rideServiceEmployee
    case maintenanceEmployee
    case manager
    case seasonPassholder
    case Senior
    case contractEmployee
    case vendor
}

class Entrant {}

class Guest: Entrant {
    //Inorder to be a guest the information needed at the gate is...
    var guestType: entrantType
    //Other info for guests
    var dateOfBirth: Int?
    var firstName: String?
    var lastName: String?
    
    
    init(type: entrantType) {
        self.guestType = type
    }
    
    init(type: entrantType, firstName: String, lastName: String){
            self.guestType = type
            self.firstName = firstName
            self.lastName = lastName
    }
    
    // if all information is inilitized
    init(type: entrantType, dateOfBirth: Int, firstName: String, lastName: String){
        self.guestType = type
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Classic: Guest {}

class Child: Guest {
    //needs age check function
}

class Senior: Guest {
    //missing dob first name and last name
}

class SeasonPassHolder: Guest {
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    init(type: entrantType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        super.init(type: type, firstName: firstName, lastName: lastName)
    }
}

class Employee: Entrant {
    var employeeType: entrantType
    //employee info
    let firstName: String
    let lastName: String
    //employee address
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    //If the inilization is for vendor other info not required
    init(type: entrantType, firstName: String, lastName: String) {
        self.employeeType = type
        self.firstName = firstName
        self.lastName = lastName
    }
    init(type: entrantType, firstName: String, lastName: String, streetAddress: String, city: String, state:String, zipCode: Int) {
        self.employeeType = type
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

class Vendor: Employee {
    let companyName: String
    let dateOfBirth: Int
    let dateOfVisit: Int
    
    init(type: entrantType, firstName: String, lastName: String, companyName: String, dateOfBirth: Int, dateOfVisit: Int) {
        self.companyName = companyName
        self.dateOfBirth = dateOfBirth
        self.dateOfVisit = dateOfVisit
        super.init(type: type, firstName: firstName, lastName: lastName)
    }
}
