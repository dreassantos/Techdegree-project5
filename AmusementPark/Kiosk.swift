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
            print("\(pass.passName) pass - Access Granted: You have access to the \(area) area\n")
        }else {
            print("\(pass.passName) pass - Access Denied: You do not have access to the \(area) area\n")
        }
    }
    
    func validateAccess(pass: Pass, at ride: RideAccess){
        if pass.rideAccess.contains(ride){
            print("\(pass.passName) pass - Access Granted: You have access to this ride\n")
        }else {
            print("\(pass.passName) pass - Access Denied: You do not have access to this ride\n")
        }
    }
    
    func validateAccess(pass: Pass, foodDiscount: Int, merchandiseDiscount: Int){
        if pass.discountAccessFor.food == foodDiscount{
            print("\(pass.passName) pass - Access Granted: You qualify for a food discount of \(foodDiscount)%\n")
        }else {
            print("\(pass.passName) pass - Access Denied: You do not qualify for a food discount of \(foodDiscount)%\n")
        }
        
        if pass.discountAccessFor.merchandise == merchandiseDiscount{
            print("\(pass.passName) pass - Access Granted: You qualify for a merchandise discount of \(merchandiseDiscount)%\n")
        }else {
            print("\(pass.passName) pass - Access Denied: You do not qualify for a merchandise discount of \(merchandiseDiscount)%\n")
        }
    }
}

