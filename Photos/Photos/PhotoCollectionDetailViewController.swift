//
//  PhotoCollectionDetailView.swift
//  Photos
//
//  Created by Albert Phone on 11/15/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionDetailViewController: UIViewController {
    
    var photo: Photo!

    @IBOutlet var photoView: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var likes: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var likebutton: UIButton!
    
    @IBAction func liked(sender: AnyObject) {
        if self.likebutton.titleLabel!.text == "Like" {
            self.likebutton.setTitle("Liked", forState: UIControlState.Normal)
            self.photo.liked = true
        } else {
            self.likebutton.setTitle("Like", forState: UIControlState.Normal)
            self.photo.liked = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageForCell(self.photo, imageView: self.photoView)
        self.username.text = "User: " + self.photo.username
        self.date.text = "Date: \(self.photo.dateText)"
        self.likes.text = "Likes: \(self.photo.likes)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: photo.url)!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                imageView.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
}