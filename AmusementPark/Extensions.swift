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
        return components(separatedBy: .whitespaces).joined()
    }
}


//Entrant Extensions
extension Entrant {
    func personalInfoCheck() throws {
        guard (self.firstName?.RemoveBlankSpaces) != nil else {
            throw EntrantErrors.missingFirstName
        }
        guard (self.lastName?.RemoveBlankSpaces) != nil else {
            throw EntrantErrors.missingLastName
        }
    }
    
    func dateOfBirthCheck() throws -> Date {
        guard let  dateOfBirth = self.dateOfBirth else {
            throw EntrantErrors.dateOfBirthMissing
        }
        return dateOfBirth
    }
    
    func addressCheck() throws {
        guard (self.streetAddress?.RemoveBlankSpaces) != nil else {
            throw EntrantErrors.missingStreetName
        }
        guard (self.city?.RemoveBlankSpaces) != nil else {
            throw EntrantErrors.missingCityName
        }
        guard (self.state?.RemoveBlankSpaces) != nil else {
            throw EntrantErrors.missingStateName
        }
        guard (self.zipCode?.RemoveBlankSpaces) != nil else {
            //accepting zip as string inorder to check then in project 5 I will convert text from field into integer.
            throw EntrantErrors.missingZipCode
        }
    }
    
    // siwpes in need to use it from the pass.
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
