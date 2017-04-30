//
//  ViewController.swift
//  InstagramStory
//
//  Created by Ivan Sapozhnik on 4/30/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "reuseIdentifier"
    let data: [(story: String, color: UIColor)] = (0...5).map {
        
        let index = $0
        let greenComponent = CGFloat(Double(25 + 15 * $0)/255.0)
        let color = UIColor(red: 155.0/255.0, green: greenComponent, blue: 155.0/255.0, alpha: 1.0)
        
        return ("Story \($0)", color)
    }
    
    let storyData: [(story: String, imageName: String)] = (0...3).map {
        
        return ("Story \($0)", "\($0).jpg")
    }
    
    var controllers: [IndexPath:UIViewController] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib.init(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        let layout = InstagramStoryCollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
    }
    
    // UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StoryCollectionViewCell
        
//        let dataElement = data[indexPath.row]
//        
//        cell.storyLabel.text = dataElement.story
//        cell.contentView.backgroundColor = dataElement.color
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fullscreen cells
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    //
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let story = storyData[indexPath.row]
        
        let cell = cell as! StoryCollectionViewCell
        let controllerToDisplay = StoryViewController(story: story.story, storyImageName: story.imageName)
        
        self.addChildViewController(controllerToDisplay)
        controllerToDisplay.view.frame = cell.contentView.bounds
        
        cell.contentView.addSubview(controllerToDisplay.view)
        cell.contentView.bringSubview(toFront: cell.dimmView)
        controllerToDisplay.didMove(toParentViewController: self)
        
        controllers[indexPath] = controllerToDisplay
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        guard let controllerToRemove = controllers[indexPath] else { return }
        
        controllerToRemove.willMove(toParentViewController: nil)
        controllerToRemove.view.removeFromSuperview()
        controllerToRemove.removeFromParentViewController()
        
        controllers[indexPath] = nil
    }
}

