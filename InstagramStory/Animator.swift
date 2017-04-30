//
//  Animator.swift
//  InstagramStory
//
//  Created by Ivan Sapozhnik on 4/30/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

final class Animator: NSObject {
    
    public var perspective: CGFloat
    public var totalAngle: CGFloat
    
    public init(perspective: CGFloat = -1 / 1500, totalAngle: CGFloat = CGFloat(Double.pi/2)) {
        self.perspective = perspective
        self.totalAngle = totalAngle
    }
    
    public func animate(collectionView: UICollectionView, attributes: InstagramStoryLayoutAttributes) {
        
        let position = attributes.middleOffset
        attributes.dimmAlpha = abs(position) - 0.4
        
        if abs(position) >= 1 {
            attributes.contentView?.layer.transform = CATransform3DIdentity
            
        } else if attributes.scrollDirection == .horizontal {
            let rotateAngle = totalAngle * position
            var transform = CATransform3DIdentity
            transform.m34 = perspective
            transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0)
            
            attributes.contentView?.layer.transform = transform
            attributes.contentView?.keepCenterAndApplyAnchorPoint(CGPoint(x: position > 0 ? 0 : 1, y: 0.5))
            attributes.dimmView?.alpha = attributes.dimmAlpha
        }
    }
}
