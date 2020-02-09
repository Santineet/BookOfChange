//
//  NetworkService.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 09.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import Foundation


class NetworkService {
    
    func request(urlStr: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}

