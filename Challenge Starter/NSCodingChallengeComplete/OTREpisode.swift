//
//  OTREpisode.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTREpisode  {
  
  var title: String
  var broadcastDate: NSDate
  var fileLocation: String
  var episodeId: Int
  var parentShow: OTRShow
  weak var favorite: OTRFavorite?
  
  init(title: String, broadcastDate: NSDate, episodeId: Int, parentShow: OTRShow, fileLocation: String) {
    self.title = title
    self.broadcastDate = broadcastDate
    self.episodeId = episodeId
    self.parentShow = parentShow
    self.fileLocation = fileLocation
  }

}
