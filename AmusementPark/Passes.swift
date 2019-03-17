//  Passes.swift
//  AmusementPark
//
//  Created by Andrea on 3/17/19.
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

enum PassType {
    case classic
    case vip
    case child
    case foodService
    case rideService
    case maintenance
    case manager
    case seasonPassholder
    case Senior
    case contractor
    case vendor
}

class Pass {
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccessFor: (food: Int, merchandise: Int)
    var passType: PassType
    // customize all the initlizers
    init(passType: PassType, areaAccess: [AreaAccess], rideAccess: [RideAccess], discountAccessFor: (food: Int, merchandise: Int)) {
        self.passType = passType
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        self.discountAccessFor = discountAccessFor
    }
}

/// Guest Passes --------------------------------------------
class GuestPass: Pass {
    init(passType: PassType, rideAccess: [RideAccess], discountAccessFor: (food: Int, merchandise: Int)){
        super.init(passType: passType, areaAccess: [AreaAccess.amusementPark], rideAccess: rideAccess, discountAccessFor: discountAccessFor)
    }
}

class ClassicPass: GuestPass {
    init(){
        super.init(passType: .classic, rideAccess: [.allRides], discountAccessFor: (food: 0, merchandise: 0))
    }
}

class VipPass: GuestPass {
    init(){
        super.init(passType: .vip, rideAccess: [.allRides, .skipTheLines], discountAccessFor: (food: 10, merchandise: 20))
    }
}

class ChildPass: GuestPass {
    //Pass only given if entrants age check passes
    init(){
        super.init(passType: .child, rideAccess: [.allRides], discountAccessFor: (food: 0, merchandise: 0))
    }
}

class SeasonPass: GuestPass {
    init(){
        super.init(passType: .seasonPassholder, rideAccess: [.allRides,.skipTheLines], discountAccessFor: (food: 10, merchandise: 20))
    }
}

class SeniorPass: GuestPass {
    init(){
        super.init(passType: .Senior, rideAccess: [.allRides, .skipTheLines], discountAccessFor: (food: 10, merchandise: 20))
    }
}




///Employee Passes -------------------------------------------------
class EmployeePass: Pass {
    init(passType: PassType, areaAccess: [AreaAccess], discountAccessFor: (food: Int, merchandise: Int)){
        super.init(passType: passType, areaAccess: areaAccess, rideAccess: [.allRides], discountAccessFor: discountAccessFor)
    }
}

class HourlyEmployeePass: EmployeePass {
    init(passType: PassType, areaAccess: [AreaAccess]){
        super.init(passType: passType, areaAccess: areaAccess, discountAccessFor: (food: 15, merchandise: 25))
    }
}

class FoodServicesPass: HourlyEmployeePass {
    init(){
        super.init(passType: .foodService, areaAccess: [.amusementPark,.kitchen])
    }
}

class RideServicesPass: HourlyEmployeePass {
    init(){
        super.init(passType: .rideService, areaAccess: [.amusementPark,.rideControl])
    }
}

class MaintenancePass: HourlyEmployeePass {
    init(){
        super.init(passType: .maintenance, areaAccess: [.amusementPark,.kitchen,.rideControl,.maintenance])
    }
}

class ManagerPass: EmployeePass {
    init(){
        super.init(passType: .manager, areaAccess: [.amusementPark,.kitchen,.rideControl,.maintenance,.office], discountAccessFor: (food: 25, merchandise: 25))
    }
}

class ContractorPass: EmployeePass {
    init(){
        super.init(passType: .contractor, areaAccess: [.amusementPark,.kitchen], discountAccessFor: (food: 0, merchandise: 0))
    }
}

class VendorPass: EmployeePass {
    init(){
        super.init(passType: .vendor, areaAccess: [.amusementPark,.kitchen], discountAccessFor: (food: 0, merchandise: 0))
    }
}



