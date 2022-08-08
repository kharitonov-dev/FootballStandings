//
//  StandingLogo.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct StandingLogo: Decodable {
    let link: String
    let width: Int
    let height: Int
    let lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case link = "href"
        case width
        case height
        case lastUpdated
    }
}
