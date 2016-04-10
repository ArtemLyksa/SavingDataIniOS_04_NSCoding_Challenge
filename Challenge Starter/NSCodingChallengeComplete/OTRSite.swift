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
  
    
    override internal var description: String  {
        return "\(name)-\(address)"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: "siteName")
        aCoder.encodeObject(address, forKey: "siteAdress")
        aCoder.encodeBool(isFree, forKey: "isFree")
        aCoder.encodeBool(isMembershipRequired, forKey: "isMembershipRequired")

    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObjectForKey("siteName") as? String,
            address = aDecoder.decodeObjectForKey("siteAdress") as? String else {
                return nil
        }
        self.init(name: name, address:address, isFree:aDecoder.decodeBoolForKey("isFree"), isMembershipRequired: aDecoder.decodeBoolForKey("isMembershipRequired"))
    }
    
  init(name: String, address:String, isFree:Bool, isMembershipRequired: Bool) {
    self.name = name
    self.address = address
    self.isFree = isFree
    self.isMembershipRequired = isMembershipRequired
  }
  
}
