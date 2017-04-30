//
//  InstagramStoryLayoutAttributes.swift
//  InstagramStory
//
//  Created by Ivan Sapozhnik on 4/30/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class InstagramStoryLayoutAttributes: UICollectionViewLayoutAttributes {

    public var contentView: UIView?
    public var dimmView: UIView?
    public var scrollDirection: UICollectionViewScrollDirection = .vertical
    public var startOffset: CGFloat = 0
    public var middleOffset: CGFloat = 0
    public var endOffset: CGFloat = 0
    public var dimmAlpha: CGFloat = 0
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! InstagramStoryLayoutAttributes
        copy.contentView = contentView
        copy.scrollDirection = scrollDirection
        copy.startOffset = startOffset
        copy.middleOffset = middleOffset
        copy.endOffset = endOffset
        copy.dimmView = dimmView
        copy.dimmAlpha = dimmAlpha
        return copy
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let o = object as? InstagramStoryLayoutAttributes else { return false }
        
        return super.isEqual(o)
            && o.contentView == contentView
            && o.scrollDirection == scrollDirection
            && o.startOffset == startOffset
            && o.middleOffset == middleOffset
            && o.endOffset == endOffset
            && o.dimmView == dimmView
            && o.dimmAlpha == dimmAlpha
    }

    
}
