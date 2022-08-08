//
//  APIManager.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

typealias LeaguesCompletion = (_ leagues: Leagues?, _ error: String?) -> Void
typealias SeasonsCompletion = (_ seasons: SeasonsResponse?, _ error: String?) -> Void
typealias StandingsCompletion = (_ standings: StandingsResponse?, _ error: String?) -> Void

struct APIManager {
    private let router = Router<BuildNetworkRequest>()
    
    func fetchLeagues(completion: @escaping LeaguesCompletion) {
        router.request(.leagues) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let leaguesResponse = try JSONDecoder().decode(Leagues.self, from: responseData)
                        completion(leaguesResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchSeasons(for leagueId: String, completion: @escaping SeasonsCompletion) {
        router.request(.seasons(id: leagueId)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }

            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)

                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }

                    do {
                        let seasonsResponse = try JSONDecoder().decode(SeasonsResponse.self, from: responseData)
                        completion(seasonsResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchStandings(for leagueId: String, season: String, completion: @escaping StandingsCompletion) {
        router.request(.standings(id: leagueId, season: season)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }

            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)

                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }

                    do {
                        let standingsResponse = try JSONDecoder().decode(StandingsResponse.self, from: responseData)
                        completion(standingsResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> ResponseStatus<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 500...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

