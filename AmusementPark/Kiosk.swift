//
//  Kiosk.swift
//  AmusementPark
//
//  Created by Andrea on 3/17/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation

class Kiosk {
    
    func validateAccess(pass: Pass, at area: AreaAccess) {
        if pass.areaAccess.contains(area){
            print("\(pass.passName) - Access Granted: You have access to the \(area) area")
        }else {
            print("\(pass.passName) - Access Denied: You do not have access to the \(area) area")
        }
    }
    
    func validateAccess(pass: Pass, at ride: RideAccess){
        if pass.rideAccess.contains(ride){
            print("\(pass.passName) - Access Granted: You have access to this ride")
        }else {
            print("\(pass.passName) - Access Denied: You do not have access to this ride")
        }
    }
    
    func validateAccess(pass: Pass, foodDiscount: Int, merchandiseDiscount: Int){
        if pass.discountAccessFor.food == foodDiscount{
            print("\(pass.passName) - Access Granted: You qualify for a food discount of \(foodDiscount)%")
        }else {
            print("\(pass.passName) - Access Denied: You do not qualify for a food discount of \(foodDiscount)%")
        }
        
        if pass.discountAccessFor.merchandise == merchandiseDiscount{
            print("\(pass.passName) - Access Granted: You qualify for a merchandise discount of \(merchandiseDiscount)%")
        }else {
            print("\(pass.passName) - Access Denied: You do not qualify for a merchandise discount of \(merchandiseDiscount)%")
        }
    }
}

