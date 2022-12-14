//
//  LeagueTableViewCell.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var abbrLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.secondaryFont
        label.textColor = UIColor.gray
        return label
    }()
    
    func configure(model: League) {
        logo.loadFrom(urlString: model.logos.light)
        nameLabel.text = model.name
        abbrLabel.text = model.abbr
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(logo)
        addSubview(nameLabel)
        addSubview(abbrLabel)
    }
    
    private func makeConstraints() {
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        abbrLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            logo.heightAnchor.constraint(equalTo: heightAnchor),
            logo.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Leagues.leftInset),
            logo.widthAnchor.constraint(equalToConstant: Constants.Leagues.logoWidth),
            
            nameLabel.leftAnchor.constraint(equalTo: logo.rightAnchor, constant: Constants.Leagues.leftInset),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.Leagues.rightInset),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            abbrLabel.leftAnchor.constraint(equalTo: logo.rightAnchor, constant: Constants.Leagues.leftInset),
            abbrLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.Leagues.rightInset),
            abbrLabel.topAnchor.constraint(equalTo: centerYAnchor),
            abbrLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }

}
