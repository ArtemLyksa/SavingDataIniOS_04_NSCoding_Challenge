//
//  OTRFavorite.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTRFavorite {

  var episode: OTREpisode
  var favoriteDate: NSDate
  var note: String
  
  init(episode:OTREpisode, favoriteDate:NSDate, note:String) {
    self.episode = episode
    self.favoriteDate = favoriteDate
    self.note = note
  }
  
}
