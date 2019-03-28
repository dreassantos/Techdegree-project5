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
    var dateOfBirth: Date?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    let kiosk = Kiosk()
    var pass: Pass = DefaultPass()
    
    init(entrantType: EntrantType,
         firstName: String? = nil,
         lastName: String? = nil,
         dateOfBirth: Date? = nil,
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
//---- Guests ------------------------------------------
class Guest: Entrant {}

class ClassicGuest: Guest {
    init() {
        super.init(entrantType: .classic)
         pass = ClassicPass()
    }
}

class VipGuest: Guest {
    init() {
        super.init(entrantType: .vip)
        pass = VipPass()
    }
}

class ChildGuest: Guest {
    init() throws {
        super.init(entrantType: .child)
        let childDateOfBirth = try requiredDateOfBirthCheck()
        if validateChildPass(dateOfBirth: childDateOfBirth) {
              pass = ChildPass()
        } else {
            try ageExceeded()
        }
    }
}

class SeasonPassHolder: Guest {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws {
    super.init(entrantType: .seasonPassholder, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        pass = SeasonPass()
    }
}

class SeniorGuest: Guest {
    init(firstName: String, lastName: String, dateOfBirth: Date) {
        super.init(entrantType: .Senior, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
        pass =  SeniorPass()
    }
}

//---Employees--------------------------------------------
class Employee: Entrant {}

class HourlyEmployee: Employee {}

class FoodServicesEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .foodService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        pass = FoodServicesPass()
    }
}

class RideServicesEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .rideService, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        pass = RideServicesPass()
    }
}

class MaintenanceEmployee: HourlyEmployee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .maintenance, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        pass = MaintenancePass()
    }
}

class Manager: Employee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .manager, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        pass = ManagerPass()
    }
}

class Contractor: Employee {
    init(firstname: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int){
        super.init(entrantType: .contracted, firstName: firstname, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    pass = ContractorPass()
    }

}

class Vendor: Employee {
    let companyName: String
    let dateOfVisit: Int
    init(firstName:String, lastName:String, dateOfBirth:
        Date, companyName: String, dateOfVisit: Int){
        self.companyName = companyName
        self.dateOfVisit = dateOfVisit
        super.init(entrantType: .vendor, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
        pass = VendorPass()
    }
}
    
// Extension Methods -----------------------------------
extension Entrant {
    func swipeAtGate(at area: AreaAccess){
        kiosk.validateAccess(pass: self.pass, at: area)
    }
    
    func swipeAtRide(at ride: RideAccess){
        kiosk.validateAccess(pass: self.pass, at: ride)
    }
    
    func swipeAtRegister(foodDiscount: Int, merchandiseDiscount: Int){
        kiosk.validateAccess(pass: self.pass, foodDiscount: foodDiscount, merchandiseDiscount: merchandiseDiscount)
    }
}

extension ChildGuest {
    func validateChildPass(dateOfBirth: Date) -> Bool {
        var passStatus = false
        let todaysDate = Date()
        if let fiveYearsAgo = Calendar.current.date(byAdding: .year, value: -5, to: todaysDate) {
            let passedTime = Calendar.current.dateComponents([.year], from: dateOfBirth, to: fiveYearsAgo)
            if let year = passedTime.year {
                if year > 4 {
                    passStatus = true
                }
            }
        }
        return passStatus
    }
}
