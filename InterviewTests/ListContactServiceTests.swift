import XCTest
@testable import Interview

class ListContactServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCallServiceWithMock() {
        let network: NetworkManagerProtocol = NetworkMockManager(mockData: mockData)
        let useCase = ListContactUseCaseService(networkOperation: network)
        
        useCase.fetchContacts { data, error in
            XCTAssertTrue(data != nil, "Deu certo carai")
        }
    }
}


var mockData: Data? {
    """
    [{
      "id": 2,
      "name": "Beyonce",
      "photoURL": "https://api.adorable.io/avatars/285/a2.png"
    }]
    """.data(using: .utf8)
}
