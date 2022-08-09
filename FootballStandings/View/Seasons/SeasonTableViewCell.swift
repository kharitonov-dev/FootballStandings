//
//  SeasonTableViewCell.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import UIKit

final class SeasonTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.secondaryFont
        return label
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.secondaryFont
        return label
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.secondaryFont
        return label
    }()
    
    func configure(model: Season) {
        nameLabel.text = model.displayName
        yearLabel.text = "Year: \(String(model.year))"
        
        let startDate = DateFormatter.getDateFromString(date: model.startDate) ?? Date()
        let startDateString = DateFormatter.getStringFromDate(date: startDate) ?? ""
        
        let endDate = DateFormatter.getDateFromString(date: model.endDate) ?? Date()
        let endDateString = DateFormatter.getStringFromDate(date: endDate) ?? ""
        
        startDateLabel.text = "Start: \(startDateString)"
        endDateLabel.text = "End: \(endDateString)"
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(yearLabel)
        addSubview(startDateLabel)
        addSubview(endDateLabel)
        
    }
    
    private func makeConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Seasons.leftInset),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.Seasons.rightInset),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor),
            
            yearLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Seasons.leftInset),
            yearLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.Seasons.bottomInset),
            
            startDateLabel.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: Constants.Seasons.leftDateInset),
            startDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.Seasons.bottomInset),
            
            endDateLabel.leftAnchor.constraint(equalTo: startDateLabel.rightAnchor, constant: Constants.Seasons.leftDateInset),
            endDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.Seasons.bottomInset),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

