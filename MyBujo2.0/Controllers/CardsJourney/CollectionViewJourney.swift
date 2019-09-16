//
//  CollectionViewJourney.swift
//  MyBujo2.0
//
//  Created by Rennan Rebouças on 15/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CollectionViewJourney: UIView, ViewCode {
    
    
    // MARK: Properties
    let  collectionView: UICollectionView = {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CollectionViewJourney.self, forCellWithReuseIdentifier: "collectioncell")
        return collection
    }()
    
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame:.zero)
        buildViewHierarchy()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Functions
    func buildViewHierarchy() {
        addSubviews([collectionView])
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfigurantion() {
        
    }
    
    
}
