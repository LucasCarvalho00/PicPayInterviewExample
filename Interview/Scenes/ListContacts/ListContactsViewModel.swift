import Foundation
import UIKit

class ListContactsViewModel {

    // MARK: Public Attributes

    weak var viewController: ListContactsViewControllerProtocol?
    
    // MARK: Private Attributes
    
    private let listContactsServiceProtocol: ListContactsUseCaseServiceProtocol
    private let userIdsLegacyUseCaseProtocol: UserIdsLegacyUseCaseProtocol
    
    // MARK: Setup

    init(viewController: ListContactsViewControllerProtocol,
         listContactsServiceProtocol: ListContactsUseCaseServiceProtocol,
         userIdsLegacyUseCaseProtocol: UserIdsLegacyUseCaseProtocol) {
        self.viewController = viewController
        self.listContactsServiceProtocol = listContactsServiceProtocol
        self.userIdsLegacyUseCaseProtocol = userIdsLegacyUseCaseProtocol
    }
    
    
    // MARK: Private Functions
    
    private func callService() {
        listContactsServiceProtocol.fetchContacts { contactsResponse, error in
            if let e = error {
                self.viewController?.showError(error: e.localizedDescription)
            }
            
            if let contact = contactsResponse {
                self.createObject(response: contact)
            }
        }
    }
    
    private func createObject(response: [ListContactsUseCaseResponse]) {
        var list: [Contact] = []
        
        response.forEach({
            list.append(
                Contact(
                    id: $0.id,
                    name: $0.name,
                    photoURL: $0.photoURL,
                    isLegacy: checkIsLegacy(id: $0.id)
                )
            )
        })
        
        viewController?.setupUI(state: .hasData(data: list))
    }
    
    private func checkIsLegacy(id: Int) -> Bool {
        userIdsLegacyUseCaseProtocol.isLegacy(id: id)
    }
}

// MARK: Extensions

extension ListContactsViewModel: ListContactsViewModelProtocol {
    func viewDidLoad() {
        callService()
    }
}


