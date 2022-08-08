//
//  StatTableViewCell.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import UIKit

final class StatTableViewCell: UICollectionViewCell {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var goalsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    func configure(model: Stat) {
        nameLabel.text = model.displayName
        descriptionLabel.text = model.description
        goalsLabel.text = model.displayValue
        configure()
    }
    
    private func configure() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(goalsLabel)
        addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
}
