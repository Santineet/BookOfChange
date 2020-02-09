//
//  NetworkResponce.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 09.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import Foundation


class NetworkMonthDataFetcher {
    
    let monthNetworkService = NetworkService()
    
    func fetchData(urlString: String, responce: @escaping (DataMonth?) -> Void) {
        
        monthNetworkService.request(urlStr: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(DataMonth.self, from: data)
                    responce(json)
                } catch let jsonError {
                    print("Error recive json request: \(jsonError.localizedDescription)" )
                }
            case .failure( let error):
                print("Error receive data from model: \(error.localizedDescription)")
                responce(nil)
            }
        }
        
    }
    
}

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchData(urlString: String, responce: @escaping (DataModel?) -> Void) {
        
        networkService.request(urlStr: urlString) { (result) in
            switch result {
            case .success(let data):

                do {

                    let json = try JSONDecoder().decode(DataModel.self, from: data)
                    responce(json)
                    
                } catch let jsonError {
                    print("Error recive json request: \(jsonError.localizedDescription)" )
                }
            case .failure( let error):
                print("Error receive data from model: \(error.localizedDescription)")
                responce(nil)
            }
        }
        
    }
    
}

