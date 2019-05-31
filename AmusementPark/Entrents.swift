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
    case defaultEntrant
}

class Entrant {
    
    var entrantType: EntrantType
    let firstName: String?
    let lastName: String?
    var dateOfBirth: Date?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    let kiosk = Kiosk()
    var pass: Pass = DefaultPass()
    
    init(entrantType: EntrantType,
         firstName: String? = nil,
         lastName: String? = nil,
         dateOfBirth: Date? = nil,
         streetAddress: String? = nil,
         city: String? = nil,
         state: String? = nil,
         zipCode: String? = nil) {
        self.entrantType = entrantType
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}
//---- Guests ------------------------------------------
class Guest: Entrant {
}

class ClassicGuest: Guest {
    init() throws {
        super.init(entrantType: .classic)
         pass = ClassicPass()
        //try dateOfBirthCheck() //  dateOfBirthCheck is also checks for birthday....
        print("Classic Guest Pass Created\n")
    }
}

class VipGuest: Guest {
    init() {
        super.init(entrantType: .vip)
        pass = VipPass()
        print("VIP Guest Pass Created\n")
    }
}

class ChildGuest: Guest {
    init(dateOfBirth: Date?) throws {
        super.init(entrantType: .child, dateOfBirth: dateOfBirth)
        let childDateOfBirth = try dateOfBirthCheck()
        try validateChildPass(dateOfBirth: childDateOfBirth)
        pass = ChildPass()
        print("Free Child Guest Pass Created\n")
    }
}

class SeasonPassHolder: Guest {
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    super.init(entrantType: .seasonPassholder, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        //must have required information
        try personalInfoCheck()
        try addressCheck()
        //create the pass if no errors
        pass = SeasonPass()
        print("Season Guest Pass Created\n")
    }
}

class SeniorGuest: Guest {
    init(firstName: String, lastName: String, dateOfBirth: Date?) throws {
    super.init(entrantType: .Senior, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
        try personalInfoCheck()
        try dateOfBirthCheck()
        pass =  SeniorPass()
        print("Senior Guest Pass Created\n")
    }
}

//---Employees--------------------------------------------
class Employee: Entrant {}

class HourlyEmployee: Employee {}

class FoodServicesEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        super.init(entrantType: .foodService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        try personalInfoCheck()
        try addressCheck()
        pass = FoodServicesPass()
        print("Food Services Employee Pass Created\n")
    }
}

class RideServicesEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        super.init(entrantType: .rideService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        try personalInfoCheck()
        try addressCheck()
        pass = RideServicesPass()
        print("Ride Services Employee Pass Created\n")
    }
}

class MaintenanceEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        super.init(entrantType: .maintenance, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        try personalInfoCheck()
        try addressCheck()
        pass = MaintenancePass()
        print("Maintenance Employee Pass Created\n")
    }
}

class Manager: Employee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        super.init(entrantType: .manager, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        try personalInfoCheck()
        try addressCheck()
        pass = ManagerPass()
        print("Manager Pass Created\n")
    }
}

class Contractor: Employee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        super.init(entrantType: .contracted, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        try personalInfoCheck()
        try addressCheck()
        pass = ContractorPass()
        print("Contractor Pass Created\n")
    }
}

class Vendor: Employee {
    let companyName: String
    let dateOfVisit: Date?
    init(firstName:String, lastName:String, dateOfBirth:
        Date?, companyName: String, dateOfVisit: Date?) throws {
        self.companyName = companyName
        self.dateOfVisit = dateOfVisit
        super.init(entrantType: .vendor, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
        try personalInfoCheck()
        try dateOfBirthCheck()
        pass = VendorPass()
        print("Vendor Pass Created\n")
    }
}

