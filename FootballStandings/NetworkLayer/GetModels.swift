//
//  GetModels.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

final class GetModels {
    
    private let apiManager = APIManager()
    
    func getLeagues(completion: @escaping (_ leagues: [League]) -> Void) {
        apiManager.fetchLeagues() { leagues, error in
            guard let leagues = leagues else {
                if let error = error {
                    print(error)
                }
                return
            }
            completion(leagues.data)
        }
    }
    
    func getSeasons(for leagueId: String, completion: @escaping (_ seasons: [Season]) -> Void) {
        apiManager.fetchSeasons(for: leagueId) { seasons, error in
            guard let seasons = seasons else {
                if let error = error {
                    print(error)
                }
                return
            }
            completion(seasons.data.seasons)
        }
    }

    func getStandings(for leagueId: String, season: String, completion: @escaping (_ standings: [Standing]) -> Void) {
        apiManager.fetchStandings(for: leagueId, season: season) { standings, error in
            guard let standings = standings else {
                if let error = error {
                    print(error)
                }
                return
            }
            completion(standings.data.standings)
        }
    }
    
}
