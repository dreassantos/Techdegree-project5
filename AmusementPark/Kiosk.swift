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
            print("Access Granted: You have access to this area")
        }else {
            print("Access Denied: You do not have access to this area")
        }
    }
    
    func validateAccess(pass: Pass, at ride: RideAccess){
        if pass.rideAccess.contains(ride){
            print("Access Granted: You have access to this ride")
        }else {
            print("Access Denied: You do not have access to this ride")
        }
    }
    
    func validateAccess(pass: Pass, foodDiscount: Int, merchandiseDiscount: Int){
        if pass.discountAccessFor.food == foodDiscount{
            print("Access Granted: You have access this discount")
        }else {
            print("Access Denied: You do not have this discount")
        }
    }
}

