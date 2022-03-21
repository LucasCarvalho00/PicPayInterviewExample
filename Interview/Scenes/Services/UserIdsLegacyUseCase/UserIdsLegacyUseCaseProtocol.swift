//
//  UserIdsLegacyUseCaseProtocol.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

protocol UserIdsLegacyUseCaseProtocol {
    func isLegacy(id: Int) -> Bool
}
