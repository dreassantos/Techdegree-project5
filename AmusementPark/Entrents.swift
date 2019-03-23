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

enum entrantErrors: Error {
    case dateOfBirthMissing
    case addressIncomplete
    case childTooOld
}

class Entrant {
    
    var entrantType: EntrantType
    let firstName: String?
    let lastName: String?
    var dateOfBirth: Date?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var pass: Pass
    //all entrants can use the kiosks
    let kiosk = Kiosk()
    
    init(entrantType: EntrantType,
         pass: Pass,
         firstName: String? = nil,
         lastName: String? = nil,
         dateOfBirth: Date? = nil,
         streetAddress: String? = nil,
         city: String? = nil,
         state: String? = nil,
         zipCode: Int? = nil) {
        self.entrantType = entrantType
        self.pass = pass
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.streetAddress = streetAddress
        self.state = state
        self.zipCode = zipCode
    }
}
//---- Guests ------------------------------------------
class Guest: Entrant {}

class ClassicGuest: Guest {
    init() {
        super.init(entrantType: .classic, pass: ClassicPass())
    }
}

class VipGuest: Guest {
    init() {
        super.init(entrantType: .vip, pass: VipPass())
    }
}

class ChildGuest: Guest {
    init(dateOfBirth: Date ) throws {
        super.init(entrantType: .child, pass: ChildPass())
        self.dateOfBirth = dateOfBirth
    
        guard validateDateOfBirth() else {
            throw entrantErrors.childTooOld
        }
    }
    
    func validateDateOfBirth() -> Bool {
        //TODO: Check date of birth must be under 5
        return true
    }
}

class SeasonPassHolder: Guest {
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(entrantType: .seasonPassholder, pass: SeasonPass(), firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class SeniorGuest: Guest {
    init(firstName: String, lastName: String, dateOfBirth: Date) {
        super.init(entrantType: .Senior, pass: SeniorPass(), firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}

//---Employees--------------------------------------------
class Employee: Entrant {}

class HourlyEmployee: Employee {}

class FoodServicesEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .foodService, pass: FoodServicesPass(), firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class RideServicesEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .rideService, pass: RideServicesPass(), firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class MaintenanceEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .maintenance, pass: MaintenancePass(), firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Manager: Employee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .manager, pass: ManagerPass(), firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Contractor: Employee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .contracted, pass: ContractorPass(), firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class Vendor: Employee {
    let companyName: String
    let dateOfVisit: Int
    init(firstName:String, lastName:String, dateOfBirth:
        Date, companyName: String, dateOfVisit: Int){
        self.companyName = companyName
        self.dateOfVisit = dateOfVisit
        super.init(entrantType: .vendor, pass: VendorPass(), firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}
// Extension Methods -----------------------------------
extension Entrant {
    func swipeAtGate(at area: AreaAccess){
        kiosk.validateAccess(pass: self.pass, at: area)
    }
    
    func swipeAtRide(at ride: RideAccess){
        kiosk.validateAccess(pass: self.pass
            , at: ride)
    }
    
    func swipeAtRegister(foodDiscount: Int, merchandiseDiscount: Int){
        kiosk.validateAccess(pass: self.pass
            , foodDiscount: foodDiscount, merchandiseDiscount: merchandiseDiscount)
    }
}

