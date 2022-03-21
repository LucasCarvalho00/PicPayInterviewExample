import UIKit

class ListContactsViewController: UIViewController {
        
    // MARK: Public Attributes

    public var viewModelProtocol: ListContactsViewModelProtocol?

    // MARK: Private Attributes

    private let viewProtocol: ListContactsViewProtocol
    
    // MARK: Setup

    init(
        viewProtocol: ListContactsViewProtocol = ListContactsView()
    ) {
        self.viewProtocol = viewProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = viewProtocol
        view.backgroundColor = .white
        view.delegate = self
        self.view = view
    }
    
    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Lista de contatos"
        loadData()
    }
    
    // MARK: Private Functions

    private func loadData() {
        viewModelProtocol?.viewDidLoad()
    }
}

// MARK: Extensions

extension ListContactsViewController: ListContactsViewViewControllerProtocol {
    func showAlert(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}

extension ListContactsViewController: ListContactsViewControllerProtocol {
    func showError(error: String) {
        print("deu error")
    }
    
    func setupUI(state: ListContactState) {
        viewProtocol.setupUI(state: state)
    }
}
