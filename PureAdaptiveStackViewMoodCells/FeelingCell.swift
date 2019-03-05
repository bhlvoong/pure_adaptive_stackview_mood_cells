//
//  FeelingCell.swift
//  PureAdaptiveStackViewMoodCells
//
//  Created by Brian Voong on 3/5/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

class FeelingCell: UITableViewCell {
    
    let numLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let moodStringLabel: UILabel = {
        let label = UILabel()
        label.text = "Mood"
        return label
    }()
    
    let emojiLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var moodStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.moodStringLabel, UIView(), self.emojiLabel])
        stackView.spacing = 4
        return stackView
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            moodStackView.axis = .vertical
        } else {
            moodStackView.axis = .horizontal
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let entireStackView = UIStackView(arrangedSubviews: [numLabel, moodStackView])
        entireStackView.spacing = 16
        
        addSubview(entireStackView)
        entireStackView.translatesAutoresizingMaskIntoConstraints = false
        entireStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        entireStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        entireStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        entireStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        entireStackView.alignment = .center
        
        numLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
