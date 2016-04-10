//
//  OTRSite.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTRSite: NSObject, NSCoding {
    
    var name: String
    var address: String
    var isFree = false
    var isMembershipRequired = false
    
    override internal var description: String {
        let isFreeString = isFree ? "free" : "Paid"
        let isMembershipRequiredString = isMembershipRequired ? "Membership is Required" : "Membership is not Required"
        return "\(name) - \(address) - \(isFreeString) - \(isMembershipRequiredString)"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "siteName")
        aCoder.encodeObject(address, forKey: "siteAddress")
        aCoder.encodeBool(isFree, forKey: "siteIsFree")
        aCoder.encodeBool(isMembershipRequired, forKey: "siteIsMembershipRequired")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObjectForKey("siteName") as? String,
            address = aDecoder.decodeObjectForKey("siteAddress") as? String
            else { return nil }
        self.init(name: name, address: address, isFree: aDecoder.decodeBoolForKey("siteIsFree"), isMembershipRequired: aDecoder.decodeBoolForKey("siteIsMembershipRequired"))
    }
    
    init(name: String, address:String, isFree:Bool, isMembershipRequired: Bool) {
        self.name = name
        self.address = address
        self.isFree = isFree
        self.isMembershipRequired = isMembershipRequired
    }
    
}
