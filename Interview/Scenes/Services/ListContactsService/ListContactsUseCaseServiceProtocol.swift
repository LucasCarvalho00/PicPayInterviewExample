//
//  ListContactsServiceProtocol.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

protocol ListContactsUseCaseServiceProtocol {
    func fetchContacts(completion: @escaping ([ListContactsUseCaseResponse]?, Error?) -> Void)
}
