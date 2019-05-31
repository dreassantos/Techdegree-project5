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
    
        let date = dateFormatter.date(from: value )
        return date
        
    }
}

extension String {
    var RemoveBlankSpaces: String {
        let stringWitoutSpaces = components(separatedBy: .whitespaces).joined()
        //print(stringWitoutSpaces)
        return stringWitoutSpaces
    }
}

//Entrant Extensions
extension Entrant {
    func personalInfoCheck() throws {
        guard let first = firstName, !first.RemoveBlankSpaces.isEmpty  else {
            throw EntrantErrors.missingFirstName
        }
        guard let last = lastName, !last.RemoveBlankSpaces.isEmpty else {
            throw EntrantErrors.missingLastName
        }
    }
    func dateOfBirthCheck() throws -> Date {
        guard let  dateOfBirth = self.dateOfBirth else {
            throw EntrantErrors.dateOfBirthMissing
        }
        birthDayCheck(dateOfBirth: dateOfBirth)
        return dateOfBirth
    }
    
    func birthDayCheck(dateOfBirth: Date) -> Bool {
        let birthDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateOfBirth)
        let todaysDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        var birthdayStatus = false
        if (birthDateComponents.month == todaysDateComponents.month) && (birthDateComponents.day == todaysDateComponents.day) {
            birthdayStatus = true
            if let firstName = self.firstName {
                print ("Happy Birthday \(firstName)! Have a wonderful visit today!")
            } else {
                print ("Happy Birthday!")
            }
        }
        return birthdayStatus
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
         guard let zip = zipCode, !zip.RemoveBlankSpaces.isEmpty else {
            //accepting zip as string inorder to check then in project 5 I will convert text from field into integer.
            throw EntrantErrors.missingZipCode
        }
    }
    
    // siwpes in need to use it from the pass.
    func swipeAtGate(gate: AreaAccess) throws {
        kiosk.validateAccess(pass: self.pass, at: gate)
        //if there is a date of birth avalible check it for a birth date
        if self.dateOfBirth != nil {
            try dateOfBirthCheck()
        }
    }
    
    func swipeAtRide(ride: RideAccess) throws {
        try kiosk.doubleSwipeCheck(lastSwipe: pass.lastSwipe)
        //if it passed then change the date
        pass.lastSwipe = Date()
        //now validate the access
        kiosk.validateAccess(pass: self.pass, at: ride)
        if self.dateOfBirth != nil {
            try dateOfBirthCheck()
        }
    
//    func swipeAtRegister(foodDiscount: Int, merchandiseDiscount: Int) throws {
//        kiosk.validateAccess(pass: self.pass, foodDiscount: foodDiscount, merchandiseDiscount: merchandiseDiscount)
//        if self.dateOfBirth != nil {
//            try dateOfBirthCheck()
//        }
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
        }
    }
}
//extension Vendor {
//    func vendorCheck() throws {
//        guard (self.companyName.RemoveBlankSpaces) != nil else {
//            throw EntrantErrors.missingCompanyName
//        }
//
//        guard let serviceDate = self.dateOfVisit else {
//            throw EntrantErrors.missingServiceDate
//        }
//    }
//}



//        // delays the check https://stackoverflow.com/questions/27517632/how-to-create-a-delay-in-swift/27517642
//        sleep(5)
