//
//  NetworkMockManager.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

enum NetworkMockManagerErros: Error {
    case noData
    case errorWithDecodable
    
    var text: String {
        switch self {
        case .noData:
            return "Data Invalida"
        case .errorWithDecodable:
            return "Erro no Decodable"
        }
    }
}

class NetworkMockManager {
    private let mockData: Data?
    
    init(mockData: Data?) {
        self.mockData = mockData
    }
    
    func callNetwork<T: Decodable>(completion: @escaping ([T]?, Error?) -> Void) {
        guard let jsonData = mockData else {
            completion(nil, NetworkMockManagerErros.noData)
            return
        }
        
        
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([T].self, from: jsonData)
            completion(decoded, nil)
        } catch {
            completion(nil, NetworkMockManagerErros.errorWithDecodable)
        }
    }
}

extension NetworkMockManager: NetworkManagerProtocol {
    func fetchNetwork<T: Decodable>(completion: @escaping ([T]?, Error?) -> Void) {
        callNetwork(completion: completion)
    }
}
