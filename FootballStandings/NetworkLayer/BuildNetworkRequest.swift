//
//  BuildNetworkRequest.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

enum BuildNetworkRequest {
    case leagues
    case seasons(id: String)
    case standings(id: String, season: String)
}

extension BuildNetworkRequest: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: Constants.BuildNetwork.baseURL) else { fatalError("baseURL error")}
        return url
    }
    
    var path: String {
        switch self {
        case .leagues:
            return "/"
        case let .seasons(id):
            return "/\(id)/seasons"
        case let .standings(id, _):
            return "/\(id)/standings"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: HTTPTask {
        switch self {
        case let .standings(_, season):
            return .requestParameters(parameters: ["season": season, "sort": "asc"])
        default:
            return .requestPlain
        }
    }
    
}
