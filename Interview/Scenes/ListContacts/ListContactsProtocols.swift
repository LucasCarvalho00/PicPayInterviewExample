//
//  ListContactsProtocol.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

protocol ListContactsViewModelProtocol {
    func viewDidLoad()
}

protocol ListContactsViewControllerProtocol: AnyObject {
    func showError(error: String)
    func setupUI(state: ListContactState)
}
