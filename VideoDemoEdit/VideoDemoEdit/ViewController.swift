//
//  ViewController.swift
//  VideoDemoEdit
//
//  Created by Trần An on 1/17/18.
//  Copyright © 2018 AnTran. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Layout
    var viewContainer : UIView = {
       let view = UIView()
        
        return view
    }()
    
    let buttonGirdView : UIButton = {
       let btn = UIButton()
        btn.setTitle("GirdLayout", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.gray
        
        return btn
    }()
    
    let buttonListView : UIButton = {
        let btn = UIButton()
        btn.setTitle("ListLayout", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.gray
        
        return btn
    }()
    
    var collectionView : UICollectionView = {
       let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        
        return collectionView
    }()
    
    //MARK: - Value
    var imageData = [UIImage]()
    var isGridFlowLayoutUsed : Bool = false
    
    var gridFlowLayout = ProductsGridFlowLayout()
    var listFlowLayout = ProductsListFlowLayout()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        initData()
    }
    
    //MARK: - Init
    func initComponent()  {
        self.view.backgroundColor = UIColor.white
        setupInitialLayout()
        setUpView()
    }
    
    func initData()  {
        setupDatasource()
    }
    //MARK: - Layout
    func setUpView()  {
        self.view.addSubview(viewContainer)
        setUpContainerView()
        
    }
    
    func setUpContainerView()  {
        self.viewContainer.backgroundColor = UIColor.white
        self.viewContainer.snp.makeConstraints { (make) in
           make.leading.trailing.top.bottom.equalToSuperview()
        }
        self.viewContainer.addSubview(collectionView)
        self.viewContainer.addSubview(buttonGirdView)
        self.viewContainer.addSubview(buttonListView)
        
        setUpCollectionView()
        setUpButton()
    }
    
    func setUpCollectionView()  {
        self.collectionView.snp.makeConstraints { (make) in
           make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.buttonGirdView.snp.bottom).offset(10)
        }
        CustomCell.registerCellByClass(collectionView)
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setUpButton() {
    
        self.buttonGirdView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(UIScreen.main.bounds.width/2)
        }
        self.buttonListView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.buttonGirdView.snp.trailing).offset(0)
            make.height.equalTo(40)
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(UIScreen.main.bounds.width/2)
        }
        self.buttonListView.addTarget(self, action: #selector(touchListView), for: .touchUpInside)
          self.buttonGirdView.addTarget(self, action: #selector(touchGirdView), for: .touchUpInside)
    }
    //MARK: - Others
    func setupDatasource() {
        imageData  = [#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1") ,#imageLiteral(resourceName: "img1")]
        self.collectionView.reloadData()
    }
    
    //MARK:  - Action
    @objc func touchGirdView()  {
        isGridFlowLayoutUsed = true
        
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: true)
        }
    }
    @objc func touchListView()  {
        isGridFlowLayoutUsed = false
        
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(self.listFlowLayout, animated: true)
        }
    }
    
    //MARK: - Layout collectionView
    func setupInitialLayout() {
        isGridFlowLayoutUsed = true
        collectionView.collectionViewLayout = gridFlowLayout
    }
}

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CustomCell.loadCell(collectionView, path: indexPath)
        cell.setUpLayout()
        cell.setUpData(data: imageData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
}
