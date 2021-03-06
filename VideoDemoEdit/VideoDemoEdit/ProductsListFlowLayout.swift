//
//  ProductsListFlowLayout.swift
//  VideoDemoEdit
//
//  Created by Trần An on 1/19/18.
//  Copyright © 2018 AnTran. All rights reserved.
//

import UIKit

class ProductsListFlowLayout: UICollectionViewFlowLayout {
    let itemHeight: CGFloat = 120
    
    override init() {
        super.init()
        setupLayout()
    }
    
    /**
     Init method
     
     - parameter aDecoder: aDecoder
     
     - returns: self
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    /**
     Sets up the layout for the collectionView. 0 distance between each cell, and vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        return (collectionView?.frame.width)!
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width : itemWidth(),height : itemHeight)
        }
        get {
            return CGSize(width : itemWidth(),height : itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
