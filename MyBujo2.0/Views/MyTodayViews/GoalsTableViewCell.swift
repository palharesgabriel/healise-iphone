//
//  GoalsTableViewCell.swift
//  MyBujo2.0
//
//  Created by Lucas Tavares on 26/08/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class GoalsTableViewCell: UITableViewCell, ViewCode {
    static let reuseIdentifier = "GoalsTableViewCell"
    
    let goalDescription: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Teste"
        return lbl
    }()
    
    let goalBullet: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "TitleColor")
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: _) has not been implemented.")
    }
    
    func buildViewHierarchy() {
        addSubview(goalDescription)
        addSubview(goalBullet)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            goalBullet.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            goalBullet.centerYAnchor.constraint(equalTo: centerYAnchor),
            goalBullet.heightAnchor.constraint(equalToConstant: 4),
            goalBullet.widthAnchor.constraint(equalToConstant: 4)
        ])
        
        NSLayoutConstraint.activate([
            goalDescription.leadingAnchor.constraint(equalTo: goalBullet.trailingAnchor, constant: 16),
            goalDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            goalDescription.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupAdditionalConfigurantion() {
    
    }
}
