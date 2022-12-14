//
//  StandingTableViewCell.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import UIKit

final class StandingCell: UITableViewCell {
    
    var stats: [Stat] = []
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.titleFont
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.bigSecondaryFont
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.bigSecondaryFont
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.secondaryFont
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var statsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StatTableViewCell.self, forCellWithReuseIdentifier: Constants.Standings.statCellIdentifier)
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = UIColor.clear
        collectionView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        collectionView.layer.borderWidth = 1
        return collectionView
    }()
    
    func configure(model: Standing) {
        logo.loadFrom(urlString: model.team.logos.first?.link)
        teamNameLabel.text = model.team.displayName
        locationLabel.text = model.team.location
        descriptionLabel.text = model.note?.description
        statusLabel.text = model.team.isActive ? Constants.Standings.statusActive : Constants.Standings.statusActive
        statusLabel.textColor = model.team.isActive ? UIColor.green : UIColor.red
        descriptionLabel.isHidden = model.note?.description == nil
        stats = model.stats
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(logo)
        stackView.addArrangedSubview(teamNameLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(statsView)
        contentView.addSubview(stackView)
        contentView.addSubview(statsView)
    }
    
    private func makeConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            logo.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Standings.leftInset),
            logo.widthAnchor.constraint(equalToConstant: Constants.Standings.logoWidth),
            logo.topAnchor.constraint(equalTo: topAnchor),
            logo.bottomAnchor.constraint(equalTo: statsView.topAnchor),
            
            stackView.leftAnchor.constraint(equalTo: logo.rightAnchor, constant: Constants.Standings.leftInset),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Standings.topInset),
            
            statsView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            statsView.heightAnchor.constraint(equalToConstant: Constants.Standings.statsHeight),
            statsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension StandingCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Standings.statCellIdentifier, for: indexPath) as? StatTableViewCell
        cell?.configure(model: stats[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension StandingCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.Standings.statsSize
    }
}
