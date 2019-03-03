//
//  Entrents.swift
//  AmusementPark
//
//  Created by Andrea on 3/2/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation

enum AreaAccess {
    case amusementPark
    case kitchen
    case rideControl
    case maintenance
    case office
}
enum RideAccess {
    case allRides
    case skipTheLines
}

protocol areaAccess {
    var areaAccess: [AreaAccess] { get set }
}

protocol Discount {
    var foodDiscount : Int { get }
    var MerchandiceDiscount: Int { get }
}

protocol NameRequired {
    var firstName: String { get set }
    var LastName: String { get set }
}

protocol AddressRequired {
    var streetAddress: String { get}
    var city: String { get }
    var state: String { get }
    var zip: Int { get }
    
}

protocol VendorInfoRequired {
    var dateOfVisit: String { get }
    var nameOfCompany: String { get }
}

protocol DateOfBirthRequired {
    var age: String { get set }
}

//Guests
class ClassicGuest: areaAccess {
    var areaAccess: [AreaAccess] = [.amusementPark]
    var rideAccess: [RideAccess] = [.allRides]
}

class VIPGuest: ClassicGuest, Discount {
    var foodDiscount = 10
    var MerchandiceDiscount = 20
    
}

class Child: ClassicGuest , DateOfBirthRequired {
    var age: String
    init(age: String ) {
        self.age = age
    }
    func isEligableAge() {}
}




