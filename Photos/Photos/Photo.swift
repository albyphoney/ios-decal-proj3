//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    /* If you like the photo. */
    var liked : Bool!
    /* The day the file was uploaded. */
    var date: NSDate!
    /* String representation fo the date. */
    var dateText: String!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        self.username = data.valueForKey("user")?.valueForKey("username") as! String
        self.likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        self.url = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        self.liked = false
        let time = data.valueForKey("created_time") as! String
        self.date = NSDate(timeIntervalSince1970: Double(time)!)
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = .MediumStyle
        self.dateText = dateFormat.stringFromDate(self.date)
    }

}