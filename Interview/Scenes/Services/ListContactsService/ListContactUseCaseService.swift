import Foundation

class ListContactUseCaseService {
    private let networkOperation: NetworkManagerProtocol
    
    init(networkOperation: NetworkManagerProtocol = NetworkManager()) {
        self.networkOperation = networkOperation
    }
}

extension ListContactUseCaseService: ListContactsUseCaseServiceProtocol {
    func fetchContacts(completion: @escaping ([ListContactsUseCaseResponse]?, Error?) -> Void) {
        self.networkOperation.fetchNetwork(completion: completion)
    }
}
