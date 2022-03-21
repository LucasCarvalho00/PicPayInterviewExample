//
//  ListContactsViewControllerConfigure.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

class ListContactsViewControllerConfigure {
    func configure() -> ListContactsViewController {
        
        let userIdsLegacyUseCaseProtocol: UserIdsLegacyUseCaseProtocol = UserIdsLegacyUseCase()
        let listContactsUseCaseServiceProtocol: ListContactsUseCaseServiceProtocol = ListContactUseCaseService()
        let viewController = ListContactsViewController()
        
        let viewModel: ListContactsViewModelProtocol = ListContactsViewModel(
            viewController: viewController,
            listContactsServiceProtocol: listContactsUseCaseServiceProtocol,
            userIdsLegacyUseCaseProtocol: userIdsLegacyUseCaseProtocol)
        
        viewController.viewModelProtocol = viewModel
        
        return viewController
    }
}
