//
//  EntrantErrors.swift
//  AmusementPark
//
//  Created by Andrea on 3/24/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation

enum EntrantErrors: Error {
    //Child Entrant Errors
    case exceededAge
    //Entrant Errors
    case dateOfBirthMissing
    case missingFirstName
    case missingLastName
    
}

extension Entrant {
    func requiredPersonlInfoCheck() throws {
        guard self.firstName != nil else {
            print("Attention: First name is required for entry")
            throw EntrantErrors.missingFirstName
        }
        guard self.lastName != nil else {
            print("Attention: Last name is required for entry")
            throw EntrantErrors.missingLastName
        }
    }
    
    func requiredDateOfBirthCheck() throws  -> Date {
        if let dateOfBirth = self.dateOfBirth {
            return dateOfBirth
        } else {
            print("Attention: Date of Birth is required for entry")
            throw EntrantErrors.dateOfBirthMissing
        }
    }
    
    func ageExceeded() throws {
        print("Attention: Entrants age exceeds the age permitted to qualify for a free child pass.")
        throw EntrantErrors.exceededAge
    }
    
    func requiredAddressCheck(){}
}
