//
//  OTRSite.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTRSite {

  var name: String
  var address: String
  var isFree = false
  var isMembershipRequired = false
  
  init(name: String, address:String, isFree:Bool, isMembershipRequired: Bool) {
    self.name = name
    self.address = address
    self.isFree = isFree
    self.isMembershipRequired = isMembershipRequired
  }
  
}
