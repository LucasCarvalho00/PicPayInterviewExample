//
//  UserIdsLegacyUseCase.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

class UserIdsLegacyUseCase {
    private let legacyIds = [10, 11, 12, 13]
    
    private func checkIsLegacy(id: Int) -> Bool {
        return legacyIds.contains(id)
    }
}

extension UserIdsLegacyUseCase: UserIdsLegacyUseCaseProtocol {
    func isLegacy(id: Int) -> Bool {
        checkIsLegacy(id: id)
    }
}
