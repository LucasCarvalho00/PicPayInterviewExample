//
//  ListContactsResponse.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

struct ListContactsUseCaseResponse: Decodable {
    var id: Int
    var name: String = ""
    var photoURL = ""
    
    init(id: Int, name: String, photoURL: String) {
        self.id = id
        self.name = name
        self.photoURL = photoURL
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case photoURL = "photoURL"
        case id = "id"
    }
}
