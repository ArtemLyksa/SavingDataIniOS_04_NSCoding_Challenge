//
//  OTRShow.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class OTRShow: NSObject, NSCoding {
    
    var title: String
    var fileName: String
    var showDescription: String
    var showId: Int
    
    override internal var description: String {
        return "\(title) - \(fileName) - \(showDescription) - \(showId)"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "showTitle")
        aCoder.encodeObject(fileName, forKey: "showFileName")
        aCoder.encodeObject(showDescription, forKey: "showDescription")
        aCoder.encodeObject(showId, forKey: "showId")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey("showTitle") as? String,
            fileName = aDecoder.decodeObjectForKey("showFileName") as? String,
            showDescription = aDecoder.decodeObjectForKey("showDescription") as? String
            else { return nil }
        self.init(title:title,
                  fileName: fileName,
                  showDescription:showDescription,
                  showId: aDecoder.decodeIntegerForKey("showId"))
    }
    
    init(title:String, fileName:String, showDescription: String, showId: Int) {
        self.title = title
        self.fileName = fileName
        self.showDescription = showDescription
        self.showId = showId
    }
    
    
}
