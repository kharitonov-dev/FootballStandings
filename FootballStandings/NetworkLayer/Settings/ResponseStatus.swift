//
//  ResponseStatus.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

enum ResponseStatus<String> {
    case success
    case failure(String)
}
