//
//  InstagramStoryCollectionViewFlowLayout.swift
//  InstagramStory
//
//  Created by Ivan Sapozhnik on 4/30/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class InstagramStoryCollectionViewFlowLayout: UICollectionViewFlowLayout {

    private var animator = Animator()
    
    public override class var layoutAttributesClass: AnyClass {
        
        return InstagramStoryLayoutAttributes.self
    }
    
    override init() {
        
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        return attributes.flatMap {
            
            return $0.copy() as? InstagramStoryLayoutAttributes
            
        }.map {
            
            self.transformLayoutAttributes($0)
        }
    }

    private func transformLayoutAttributes(_ attributes: InstagramStoryLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        guard let collectionView = self.collectionView else { return attributes }
        
        var distance: CGFloat = 0.0
        var itemOffset: CGFloat = 0.0
        
        if scrollDirection == .horizontal {
            distance = collectionView.frame.width
            itemOffset = attributes.center.x - collectionView.contentOffset.x
            attributes.startOffset = (attributes.frame.origin.x - collectionView.contentOffset.x) / attributes.frame.width
            attributes.endOffset = (attributes.frame.origin.x - collectionView.contentOffset.x - collectionView.frame.width) / attributes.frame.width
        }
        
        attributes.scrollDirection = scrollDirection
        attributes.middleOffset = itemOffset / distance - 0.5
        
        if attributes.contentView == nil,
            let contentView = collectionView.cellForItem(at: attributes.indexPath)?.contentView {
            attributes.contentView = contentView
        }
        
        if attributes.dimmView == nil,
            let cell = collectionView.cellForItem(at: attributes.indexPath) as? Dimmable {
            attributes.dimmView = cell.dimmView
        }
        
        animator.animate(collectionView: collectionView, attributes: attributes)
        
        return attributes
    }
}
