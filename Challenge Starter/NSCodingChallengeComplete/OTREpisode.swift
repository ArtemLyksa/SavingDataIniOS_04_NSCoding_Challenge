//
//  OTREpisode.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTREpisode: NSObject, NSCoding  {
  
  var title: String
  var broadcastDate: NSDate
  var fileLocation: String
  var episodeId: Int
  var parentShow: OTRShow
  weak var favorite: OTRFavorite?
    
    override internal var description: String {
        return "\(title) - \(broadcastDate) - \(fileLocation) - \(episodeId)"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "episodeTitle")
        aCoder.encodeObject(broadcastDate, forKey: "episodeBroadcastDate")
        aCoder.encodeObject(fileLocation, forKey: "episodeFileLocation")
        aCoder.encodeObject(favorite, forKey: "favorite")
        aCoder.encodeObject(parentShow, forKey: "episodeParentShow")
        aCoder.encodeInteger(episodeId, forKey: "showEpisodeId")
        
    }
    convenience required init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey("episodeTitle") as? String,
            broadcastDate = aDecoder.decodeObjectForKey("episodeBroadcastDate") as? NSDate,
            fileLocation = aDecoder.decodeObjectForKey("episodeFileLocation") as? String,
            parentShow = aDecoder.decodeObjectForKey("episodeParentShow") as? OTRShow else {
                return nil
        }
        
        self.init(title: title, broadcastDate: broadcastDate, episodeId: aDecoder.decodeIntegerForKey("showEpisodeId"),
                    parentShow: parentShow, fileLocation: fileLocation)
        
        aDecoder.decodeObjectForKey("favorite") as? OTRFavorite
    }
  
  init(title: String, broadcastDate: NSDate, episodeId: Int, parentShow: OTRShow, fileLocation: String) {
    self.title = title
    self.broadcastDate = broadcastDate
    self.episodeId = episodeId
    self.parentShow = parentShow
    self.fileLocation = fileLocation
  }

}
