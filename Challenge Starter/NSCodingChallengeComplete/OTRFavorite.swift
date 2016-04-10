//
//  OTRFavorite.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTRFavorite: NSObject, NSCoding {

  var episode: OTREpisode
  var favoriteDate: NSDate
  var note: String
    
    override internal var description: String  {
        return "\(episode.title) - \(favoriteDate) - \(note)"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(episode, forKey: "favouriteEpisode")
        aCoder.encodeObject(favoriteDate, forKey: "favoriteDate")
        aCoder.encodeObject(note, forKey: "favouriteNote")

    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        guard let episode = aDecoder.decodeObjectForKey("favouriteEpisode") as? OTREpisode,
            favoriteDate = aDecoder.decodeObjectForKey("favoriteDate") as? NSDate,
            note = aDecoder.decodeObjectForKey("favouriteNote") as? String else {
                return nil
        }
        self.init(episode:episode, favoriteDate:favoriteDate, note:note)
    }
  
  init(episode:OTREpisode, favoriteDate:NSDate, note:String) {
    self.episode = episode
    self.favoriteDate = favoriteDate
    self.note = note
  }
  
}
