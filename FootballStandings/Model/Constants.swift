//
//  Constants.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import UIKit

struct Constants {
    
    // MARK: Network
    struct Server {
        static let baseURL = "https://api-football-standings.azharimm.site/leagues"
    }
    
    // MARK: UI
    struct Fonts {
        static let bigTitleFont = UIFont.systemFont(ofSize: 24)
        static let titleFont = UIFont.systemFont(ofSize: 22)
        static let bigSecondaryFont = UIFont.systemFont(ofSize: 14)
        static let secondaryFont = UIFont.systemFont(ofSize: 12)
    }
    
    struct Leagues {
        // Table
        static let title = "Leagues"
        static let rowHeight: CGFloat = 70
        // Cell
        static let cellIdentifier = "LeagueCell"
        static let leftInset: CGFloat = 10
        static let rightInset: CGFloat = 10
        static let logoWidth: CGFloat = 50
    }
    
    struct Seasons {
        // Table
        static let title = "Seasons"
        static let rowHeight: CGFloat = 70
        
        // Cell
        static let cellIdentifier = "SeasonCell"
        static let leftInset: CGFloat = 10
        static let rightInset: CGFloat = 10
        static let leftDateInset: CGFloat = 20
        static let bottomInset: CGFloat = -5
    }
    
    struct Standings {
        // Table
        static let title = "Standings"
        static let btnTitleRightNavigation = "Seasons"
        static let btnTitleToolBar = "Done"
        static let rowHeight: CGFloat = 200
        
        // Cell
        static let cellIdentifier = "StandingCell"
        static let statCellIdentifier = "StatCell"
        static let statusActive = "Active"
        static let statusInactive = "Inactive"
        static let logoWidth: CGFloat = 70
        static let statsHeight: CGFloat = 100
        static let topInset: CGFloat = 25
        static let leftInset: CGFloat = 10
        static let statsSize = CGSize(width: 120, height: 100)
    }
    
    struct Stat {
        static let leftInset: CGFloat = 10
        static let rightInset: CGFloat = -10
    }
}
