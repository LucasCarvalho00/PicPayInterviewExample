//
//  NetworkManagerProtocol.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchNetwork<T: Decodable>(completion: @escaping ([T]?, Error?) -> Void)
}
