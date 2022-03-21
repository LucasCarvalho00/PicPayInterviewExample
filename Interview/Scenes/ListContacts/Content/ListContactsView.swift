//
//  ListContactsView.swift
//  Interview
//
//  Created by Lucas De Castro Carvalho on 21/03/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation
import UIKit

class ListContactsView: UIView {
    
    // MARK: - Private Attributes

    private var contacts = [Contact]()

    // MARK: - Delegates
    
    weak var delegate: ListContactsViewViewControllerProtocol?

    // MARK: - UI
    
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.register(ContactCell.self, forCellReuseIdentifier: String(describing: ContactCell.self))
        tableView.backgroundView = activity
        tableView.tableFooterView = UIView()
        return tableView
    }()
        
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Functions

    private func constraintUI() {
        self.backgroundColor = .red
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    private func loadData(data: [Contact]) {
        self.contacts = data
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activity.stopAnimating()
        }
    }
}

// MARK: Extensions

extension ListContactsView: ListContactsViewProtocol {
    func setupUI(state: ListContactState) {
        switch state {
        case let .hasData(data):
            loadData(data: data)
        }
    }
}
                                
extension ListContactsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactCell.self), for: indexPath) as? ContactCell else {
            return UITableViewCell()
        }
        
        let contact = contacts[indexPath.row]
        cell.fullnameLabel.text = contact.name
        cell.contactImage.image = nil
        
        if let urlPhoto = URL(string: contact.photoURL) {
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let data = try Data(contentsOf: urlPhoto)
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        cell.contactImage.image = image
                    }
                } catch _ {}
            }
        }
        
        return cell
    }
}

extension ListContactsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contato = contacts[indexPath.row - 1]
        
        guard contato.isLegacy else {
            let alert = UIAlertController(title: "Você tocou em", message: "\(contato.name)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            delegate?.showAlert(alert: alert)
            return
        }
        
        let alert = UIAlertController(title: "Atenção", message:"Você tocou no contato sorteado", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        delegate?.showAlert(alert: alert)
    }
}
