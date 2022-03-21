//
//  ListContactsViewProtocol.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation
import UIKit

enum ListContactState {
    case hasData(data: [Contact])
}

protocol ListContactsViewViewControllerProtocol: AnyObject {
    func showAlert(alert: UIAlertController)
}

protocol ListContactsViewProtocol: UIView {
    var delegate: ListContactsViewViewControllerProtocol? { get set }
    
    func setupUI(state: ListContactState)
}
