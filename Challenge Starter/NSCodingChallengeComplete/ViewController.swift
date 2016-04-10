//
//  ViewController.swift
//  NSCodingChallengeComplete
//
//  Created by Brian on 11/24/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = NSFileManager.defaultManager()
        
        
        let otrUrl: NSURL
        do {
            otrUrl = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        } catch {
            return
        }
        let otrFile = otrUrl.URLByAppendingPathComponent("otr.bin")
        //    guard let otrData = NSData(contentsOfURL: otrFile) else {
        //      return
        //    }
        
        
        guard let url = NSBundle.mainBundle().URLForResource("old_time_radio", withExtension: "plist") else {
            return
        }
        let plistData = NSData(contentsOfURL: url)
        guard let oldTimeRadio = NSPropertyListSerialization.propertyListFromData(plistData!, mutabilityOption: .Immutable, format: nil, errorDescription: nil) else {
            return
        }
        
        var sites: [OTRSite] = [OTRSite]()
        var shows: [OTRShow] = [OTRShow]()
        var episodes: [OTREpisode] = [OTREpisode]()
        var favorites: [OTRFavorite] = [OTRFavorite]()
        
        let siteDirectory = oldTimeRadio["Sites"] as! [[String:AnyObject]]
        for directory in siteDirectory {
            let name = directory["Name"] as! String
            let address = directory["Address"] as! String
            let isFree = directory["Is Free"] as! NSNumber
            let isMembershipRequired = directory["Membership Required"] as! NSNumber
            
            let site = OTRSite(name: name, address: address, isFree: isFree.boolValue, isMembershipRequired: isMembershipRequired.boolValue)
            sites.append(site)
        }
        
        let otrShows = oldTimeRadio["Shows"] as! [[String:AnyObject]]
        for show in otrShows {
            let showId = show["Id"] as! NSNumber
            let title = show["Title"] as! String
            let thumbnail = show["Thumbnail"] as! String
            let showDescription = show["Description"] as! String
            
            let otrShow = OTRShow(title: title, fileName: thumbnail, showDescription: showDescription, showId: showId.integerValue)
            shows.append(otrShow)
        }
        
        let otrEpisodes = oldTimeRadio["Episodes"] as! [[String:AnyObject]]
        for episode in otrEpisodes {
            let showId = episode["Show Id"] as! NSNumber
            var parentShow: OTRShow? = nil
            for show in shows {
                if show.showId == showId.integerValue {
                    parentShow = show
                    break
                }
            }
            
            if parentShow != nil {
                let broadcast = episode["Broadcast Date"] as! NSDate
                let fileLocation = episode["File Location"] as! String
                let title = episode["Title"] as! String
                let episodeId = episode["Episode Id"] as! NSNumber
                let otrEpisode = OTREpisode(title: title, broadcastDate: broadcast, episodeId: episodeId.integerValue, parentShow: parentShow!, fileLocation: fileLocation)
                episodes.append(otrEpisode)
            }
        }
        
        let otrFavorites = oldTimeRadio["Favorites"] as! [[String:AnyObject]]
        
        for favorite in otrFavorites {
            var favoriteEpisode: OTREpisode? = nil
            
            let episodeId = favorite["Episode Id"] as! NSNumber
            let note = favorite["Note"] as! String
            let favoriteDate = favorite["Favorite Date"] as! NSDate
            
            for episode in episodes {
                if episode.episodeId == episodeId.integerValue {
                    favoriteEpisode = episode
                    break
                }
            }
            
            let favorite = OTRFavorite(episode: favoriteEpisode!, favoriteDate: favoriteDate, note: note)
            favorites.append(favorite)
        }
        
        let objectGraph: [String:AnyObject] = ["Favorites" : favorites, "Shows" : shows, "Episodes" : episodes, "Sites" : sites]
        let data = NSKeyedArchiver.archivedDataWithRootObject(objectGraph)
        
        print(data.writeToURL(otrFile, atomically: true))
        
        
        let rootObject = NSKeyedUnarchiver.unarchiveObjectWithData(data)
        
        let unarchivedEpisodes = rootObject!["Episodes"]!! as! [OTREpisode]
        let unarchivedFavorites = rootObject!["Favorites"]!! as! [OTRFavorite]
        
        for episode in unarchivedEpisodes {
            print(episode)
        }
        
        for favorite in unarchivedFavorites {
            print(favorite)
        }
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

