//
//  Router.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

class Router<Target: TargetType>: RouterProtocol {
    private var task: URLSessionTask?
    
    func request(_ route: Target, completion: @escaping RouterProtocolCompletion) {
        let session = URLSession.shared
        
        do {
            let request = try buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
    
    private func buildRequest(from route: Target) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.method.rawValue
        
        do {
            switch route.task {
            case .requestPlain:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let parameters):
                try URLParameterEncoder.encode(urlRequest: &request, with: parameters)
            }
            return request
        } catch {
            throw error
        }
    }
}
