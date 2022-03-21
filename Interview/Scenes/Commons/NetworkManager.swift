//
//  NetworkOperation.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

/*
 Json Contract
[
  {
    "id": 1,
    "name": "Shakira",
    "photoURL": "https://api.adorable.io/avatars/285/a1.png"
  }
]
*/

class NetworkManager {
    private let apiURL = "https://run.mocky.io/v3/d26d86ec-fb82-48a7-9c73-69e2cb728070"

    private func callNetwork<T: Decodable>(completion: @escaping ([T]?, Error?) -> Void) {
        guard let api = URL(string: apiURL) else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: api) { (data, response, error) in
            guard let jsonData = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([T].self, from: jsonData)
                
                completion(decoded, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
}

extension NetworkManager: NetworkManagerProtocol {
    func fetchNetwork<T: Decodable>(completion: @escaping ([T]?, Error?) -> Void) {
        callNetwork(completion: completion)
    }
}
