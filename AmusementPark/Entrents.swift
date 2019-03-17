//  Entrents.swift
//  AmusementPark
//  Created by Andrea on 3/2/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.

import Foundation

enum EntrantType {
    case classic
    case vip
    case child
    case foodService
    case rideService
    case maintenance
    case manager
    case seasonPassholder
    case Senior
    case contracted
    case vendor
}

class Entrant {
    
    var entrantType: EntrantType
    let firstName: String?
    let lastName: String?
    var dateOfBirth: Int?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    init(entrantType: EntrantType,
         firstName: String? = nil,
         lastName: String? = nil,
         dateOfBirth: Int? = nil,
         streetAddress: String? = nil,
         city: String? = nil,
         state: String? = nil,
         zipCode: Int? = nil) {
        self.entrantType = entrantType
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.streetAddress = streetAddress
        self.state = state
        self.zipCode = zipCode
        
    }
}

class Guest: Entrant {}

// Guests
class ClassicGuest: Guest {
    let pass = ClassicPass()
    init() {
        super.init(entrantType: .classic)
    }
}

class VipGuest: Guest {
    let pass = VipGuest()
    init() {
        super.init(entrantType: .vip)
    }
    
}

class ChildGuest: Guest {
    let pass = ChildPass()
    //Change to DATE
    init(dateOfBirth: Int) {
        super.init(entrantType: .child)
        self.dateOfBirth = dateOfBirth
    }
    
    func validateDateOfBirth() {
        //Make an alert
        if let childsDateOfBirth = dateOfBirth {
            (childsDateOfBirth < 5) ?
            (print("child quilifies for a free child pass")) : (print("Does not qualifiy"))
        } else { //the value of the optional is not set or nil
            print("Alert - date of birth required to quilify for free child pass")
        }
    }
}
    
class SeasonPassHolder: Guest {
    let pass = SeasonPass()
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(entrantType: .seasonPassholder, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}
    
class SeniorGuest: Guest {
    let pass = SeniorPass()
    init(firstName: String, lastName: String, dateOfBirth: Int) {
        super.init(entrantType: .Senior, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}
    
//Employees
class Employee: Entrant {}

class HourlyEmployee: Employee {}

class FoodServicesEmployee: HourlyEmployee {
    let pass = FoodServicesPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .foodService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class RideServicesEmployee: HourlyEmployee {
    let pass = RideServicesPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .rideService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class MaintenanceEmployee: HourlyEmployee {
    let pass = MaintenancePass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .maintenance, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Manager: Employee {
    let pass = ManagerPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .manager, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Contracted: Employee {
    let pass = ContractorPass()
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .contracted, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Vendor: Employee {
    let pass = VendorPass()
    let companyName: String
    let dateOfVisit: Int
    init(firstName:String, lastName:String, dateOfBirth: Int, companyName: String, dateOfVisit: Int){
        self.companyName = companyName
        self.dateOfVisit = dateOfVisit
        super.init(entrantType: .vendor, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}
