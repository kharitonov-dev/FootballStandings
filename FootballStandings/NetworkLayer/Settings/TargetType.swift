//
//  TargetType.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
}
