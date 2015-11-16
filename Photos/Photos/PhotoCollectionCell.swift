//
//  PhotoCollectionCell.swift
//  Photos
//
//  Created by Albert Phone on 11/15/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    let pic = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.pic.frame = bounds
        addSubview(self.pic)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}