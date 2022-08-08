//
//  RouterProtocol.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

typealias RouterProtocolCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol RouterProtocol: AnyObject {
    associatedtype Target: TargetType
    func request(_ route: Target, completion: @escaping RouterProtocolCompletion)
    func cancel()
}
