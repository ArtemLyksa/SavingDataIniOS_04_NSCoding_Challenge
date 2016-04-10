//
//  OTREpisode.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTREpisode: NSObject {
    
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
    
    override internal var description: String {
        return "\(title) - \(broadcastDate) - \(episodeId) - \(fileLocation)"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey("episodeTitle") as? String,
            broadcastDate = aDecoder.decodeObjectForKey("episodeDate") as? NSDate,
            fileLocation = aDecoder.decodeObjectForKey("episodeLocation") as? String,
            parentShow = aDecoder.decodeObjectForKey("episodeShow") as? OTRShow else {
                return nil
        }
        self.init(title:title, broadcastDate:broadcastDate, episodeId:aDecoder.decodeIntegerForKey("episodeId"), parentShow:parentShow, fileLocation:fileLocation)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "episodeTitle")
        aCoder.encodeObject(broadcastDate, forKey: "episodeDate")
        aCoder.encodeInteger(episodeId, forKey: "episodeId")
        aCoder.encodeObject(parentShow, forKey: "episodeShow")
        aCoder.encodeObject(fileLocation, forKey: "episodeLocation")
    }
    
}
