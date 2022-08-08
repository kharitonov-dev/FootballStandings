//
//  HTTPTask.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

enum HTTPTask {
    case requestPlain
    case requestParameters(parameters: Parameters)
}
