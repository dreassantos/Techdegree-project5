//
//  Extensions.swift
//  AmusementPark
//
//  Created by Andrea Salazar Santos on 3/28/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation


extension Date {
    static func dateFromString(value: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
    
        print(value)
        let date = dateFormatter.date(from: value )
        print(date)
        return date
    }
}

extension String {
    var RemoveBlankSpaces: String {
        let stringWitoutSpaces = components(separatedBy: .whitespaces).joined()
        //print(stringWitoutSpaces)
        return stringWitoutSpaces
    }
    var isInt: Bool {
        return Int(self) != nil
    }
}


//Entrant Extensions
extension Entrant {
    
    func validateProjectNumber(_ projectNumber: String?) throws {
        //These are the only valid projectNumbers
        guard let projectNumber  = projectNumber else {
            //Throw project number is required....
            throw EntrantErrors.projectNumberMissing
        }
        let projectNumbers = [1001,1002,1003,2001,2002]
        if !(projectNumber.count == 4){
            throw EntrantErrors.invalidProjectNumberLength
        }
        var validStatus = false
        for number in projectNumbers {
            if (Int(projectNumber) == number){
                validStatus = true
            }
        }
        if !(validStatus){
            throw  EntrantErrors.projectNumberInvalid
        }
    }
    
    func personalInfoCheck() throws {
        guard let first = firstName, !first.RemoveBlankSpaces.isEmpty else {
            throw EntrantErrors.missingFirstName
        }
        guard let last = lastName, !last.RemoveBlankSpaces.isEmpty else {
            throw EntrantErrors.missingLastName
        }
    }
    
    func dateOfBirthCheck() throws -> Date {
        if let  dateOfBirth = self.dateOfBirth {
            try birthDayCheck(dateOfBirth: dateOfBirth)
            return dateOfBirth
        }
        else {
            throw EntrantErrors.dateOfBirthMissing
        }
    }
    
    func validateDate(_ date: String) throws {
        if !(date.count == 10) && !(date.count == 0) {
           throw EntrantErrors.invalidDate
        }
    }
    
    func dateOfServiceCheck(_ date: Date?) throws {
        guard let dateOfService = date else {
            throw EntrantErrors.missingServiceDate
        }
    }
    
    func birthDayCheck(dateOfBirth: Date) throws {
        let birthDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateOfBirth)
        let todaysDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        //var birthdayStatus = false
        if (birthDateComponents.month == todaysDateComponents.month) && (birthDateComponents.day == todaysDateComponents.day) {
           // birthdayStatus = true
            if let firstName = self.firstName {
                throw EntrantErrors.HappyBirthday(firstName)
            } else {
                throw EntrantErrors.HappyBirthday("")
            }
        }
    }
    
    func addressCheck() throws {
        guard let street = streetAddress, !street.RemoveBlankSpaces.isEmpty else {
            throw EntrantErrors.missingStreetName
        }
         guard let city = city, !city.RemoveBlankSpaces.isEmpty else {
            throw EntrantErrors.missingCityName
        }
         guard let state = state, !state.RemoveBlankSpaces.isEmpty else {
            throw EntrantErrors.missingStateName
        }
        if let zip = zipCode, !zip.RemoveBlankSpaces.isEmpty {
            if !(zip.isInt) {
                throw EntrantErrors.invalidZipCodeText
            }
            else if !(zip.count == 5){
                throw EntrantErrors.invalidZipCodeLength
            }
        }
        else {
                 throw EntrantErrors.missingZipCode
        }
    }
    
    // siwpes in need to use it from the pass.
//    func swipeAtGate(gate: AreaAccess) throws {
//        kiosk.validateAccess(pass: self.pass, at: gate)
//        //if there is a date of birth avalible check it for a birth date
//        if self.dateOfBirth != nil {
//            try dateOfBirthCheck()
//        }
//    }
//    func swipeAtRegister(foodDiscount: Int, merchandiseDiscount: Int) throws {
//        kiosk.validateAccess(pass: self.pass, foodDiscount: foodDiscount, merchandiseDiscount: merchandiseDiscount)
//        if self.dateOfBirth != nil {
//            try dateOfBirthCheck()
//        }
//    }
//
//    func swipeAtRide(ride: RideAccess) throws {
//        try kiosk.doubleSwipeCheck(lastSwipe: pass.lastSwipe)
//        //if it passed then change the date
//        pass.lastSwipe = Date()
//        //now validate the access
//        kiosk.validateAccess(pass: self.pass, at: ride)
//        if self.dateOfBirth != nil {
//            try dateOfBirthCheck()
//        }
//    }
    
    func validateVendor (_ vendorName: String?) throws {
        guard let vendorName = vendorName else {
            throw EntrantErrors.vendorNameMissing
        }
        let acceptedVendors = ["acme","nw electrical","fedex","orkin"]
        let vendorNameLowerCase = vendorName.lowercased()
        var validStatus = false
        for vendor in acceptedVendors {
            if vendor == vendorNameLowerCase {
                validStatus = true
            }
        }
        if !(validStatus){
            print(vendorNameLowerCase)
            throw  EntrantErrors.invalidVendorName
        }
    }
}

extension ChildGuest {
    func validateChildPass(dateOfBirth: Date) throws {
        let todaysDate = Date()
        let passedTime = Calendar.current.dateComponents([.year], from: dateOfBirth, to: todaysDate)
        if let year = passedTime.year {
            if year >= 4 {
                throw EntrantErrors.exceededAge
            }
            else if year < 0 {
                throw EntrantErrors.futureKid
            }
        }
    }
}

extension ContractorPass {
    func validateContractorAccess(projectNumber: String) -> [AreaAccess] {
        var areaAccess:[AreaAccess] = []
        switch projectNumber {
        case "1001": areaAccess = [.amusementPark,.rideControl]
        case "1002": areaAccess =  [.amusementPark,.rideControl,.maintenance]
        case "1003": areaAccess = [.amusementPark,.rideControl,.kitchen,.maintenance,.office]
        case "2001": areaAccess = [.office]
        case "2002": areaAccess = [.kitchen,.maintenance]
        default: areaAccess = []
        }
        return areaAccess
    }
}

extension VendorPass {
    func validateVendorAccess(companyName: String) -> [AreaAccess] {
        var areaAccess: [AreaAccess] = []
        switch companyName.lowercased() {
        case "orkin": areaAccess = [.amusementPark,.rideControl,.kitchen]
        case "acme": areaAccess = [.kitchen]
        case "fedex": areaAccess = [.maintenance,.office]
        case "nw electrical": areaAccess = [.amusementPark,.kitchen,.maintenance,.office,.rideControl]
        default: areaAccess = []
        }
        return areaAccess
    }
}

        


//        // delays the check https://stackoverflow.com/questions/27517632/how-to-create-a-delay-in-swift/27517642
//        sleep(5)
