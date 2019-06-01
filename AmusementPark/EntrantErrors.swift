//  EntrantErrors.swift
//  AmusementPark
//
//  Created by Andrea on 3/24/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation
import UIKit

enum EntrantErrors: Error {
    //Child Entrant Errors
    case exceededAge
    case futureKid
    //Required personl Info
    case dateOfBirthMissing
    case missingFirstName
    case missingLastName
    case invalidDate
    //Required address
    case missingStreetName
    case missingCityName
    case missingStateName
    case missingZipCode
    //vendor errors
    case missingServiceDate
    case missingCompanyName
    //
    case projectNumberInvalid
    case projectNumberMissing
    case invalidProjectNumberLength
    //
    case vendorNameMissing
    case invalidVendorName
    case HappyBirthday
    
}


extension EntrantErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .exceededAge: return
            "Attention: Entrants age exceeds the age permitted to qualify for a free child pass.\n"
        case .futureKid: return
            "Attention: \"Future\" children do not qualify for a free child pass....."
        case .dateOfBirthMissing: return "Attention: Entrants date of birth is required for entry.\n"
        case .missingFirstName: return
            "Attention: Entrants first Name is required for entry.\n"
        case .missingLastName: return
            "Attention: Entrants last name is required for entry.\n"
        case .missingStreetName: return
            "Attention: Entrants street is required for entry.\n"
        case .missingCityName: return
            "Attention: Entrants city is required for entry.\n"
        case .missingStateName: return
            "Attention: Entrants state is required for entry.\n"
        case .missingZipCode: return
            "Attention: Entrants zipcode is required for entry.\n"
        case .missingServiceDate: return
            "Attention: Vendors Date of service is required for entry.\n"
        case .missingCompanyName: return
            "Attention: Vendors Company Name is required for entry.\n"
        case .projectNumberMissing: return
            "Attention: Project Number is needed for entry."
        case.projectNumberInvalid: return
            "Attention: Could not validate project number."
        case .invalidProjectNumberLength: return
            "Attention: Your Project Number does not meet the required length"
        case .vendorNameMissing: return
            "Attention: Vendors name is required for entry"
        case .invalidVendorName: return
            "Attention: Could not validate this vendor."
        case .invalidDate: return
            "Attention: Date Must Be in the format MM/DD/YYYY"
        //Not really an error but it is something that must be alerted
        case .HappyBirthday: return
            "HappyBirthday!\n Happy Birthday"
        }
    }
}

//func entrantAlert(title: String, message: String) {
//    var alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
//}
