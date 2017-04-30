//
//  StoryViewController.swift
//  InstagramStory
//
//  Created by Ivan Sapozhnik on 4/30/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var storyImageView: UIImageView!
    
    private var storyImageName: String
    private var storyName: String
    
    init(story: String, storyImageName: String) {
        
        self.storyImageName = storyImageName
        self.storyName = story
        
        super.init(nibName: "StoryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storyLabel.text = self.storyName
        self.storyImageView.image = UIImage(named: self.storyImageName)
    }
}
