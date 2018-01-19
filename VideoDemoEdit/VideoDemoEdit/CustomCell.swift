//
//  CustomCell.swift
//  VideoDemoEdit
//
//  Created by Trần An on 1/19/18.
//  Copyright © 2018 AnTran. All rights reserved.
//

import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    
    // MARK: define for cell
    static func identifier() -> String {
        return String(describing: self.self)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    var image : UIImageView  = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    func setUpData(data : UIImage)  {
        self.image.image = data
    }
    
    func setUpLayout()  {
        self.contentView.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.contentView.clipsToBounds =  true
    }
    
    static func registerCellByClass(_ collectionView: UICollectionView) {
        collectionView.register(self.self, forCellWithReuseIdentifier: self.identifier())
    }
    static func loadCell(_ collectionView: UICollectionView, path: IndexPath) -> CustomCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier(), for: path) as! CustomCell
    }
}
