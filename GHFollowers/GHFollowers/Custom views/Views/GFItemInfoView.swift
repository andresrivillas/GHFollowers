//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Andres Rivillas on 7/09/24.
//

import UIKit

enum ItemInfoType {
    case repos, gist, followers, following
}

class GFItemInfoView: UIView {

    let symbolImageview = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(symbolImageview)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageview.translatesAutoresizingMaskIntoConstraints = false
        symbolImageview.contentMode = .scaleAspectFill
        symbolImageview.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageview.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageview.heightAnchor.constraint(equalToConstant: 20),
            symbolImageview.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageview.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageview.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageview.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageview.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gist:
            symbolImageview.image = SFSymbols.gist
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageview.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImageview.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        
        countLabel.text = String(count)
    }
    
}
