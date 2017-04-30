//
//  StoryCollectionViewCell.swift
//  InstagramStory
//
//  Created by Ivan Sapozhnik on 4/30/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

protocol Dimmable {
    var dimmView: UIView! { get set }
}

class StoryCollectionViewCell: UICollectionViewCell, Dimmable {

    @IBOutlet weak var dimmView: UIView!
    @IBOutlet weak var storyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
