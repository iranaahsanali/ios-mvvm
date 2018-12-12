//
//  ViewController.swift
//  MVVM
//
//  Created by Ahsan Ali on 06/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class EmployeeVC: MainUIVC {

    let tableView = UITableView()
    let txtSearchField = UITextField()
    
    let viewModal = EmployeeViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        setupSearchField()
        setupTableView()
        bindViewModal()
        handleActivityIndicator()
    }

    // MARK: - View Modal Binding
    func bindViewModal()
    {
        viewModal.searchString.bidirectionalBind(to: txtSearchField.reactive.text)
        viewModal.validSearchText
            .map { $0 ? .black : .red }
            .bind(to: txtSearchField.reactive.textColor)
        bindTableView()
    }
    
    func bindTableView()
    {
        viewModal.cellViewModals.bind(to: tableView, animated: true) { dataSource, indexPath, tableView in
            let cell = EmployeeCell()
            cell.populateData(viewModal: dataSource[indexPath.row])
            return cell
        }
    }

    // MARK:- Activity Indicatoin Handling
    func handleActivityIndicator()
    {
        viewModal.updateLoadingStatus = { [weak self] () in
            let isLoading = self?.viewModal.isLoading ?? true
            print(isLoading)
            if isLoading
            {
                self?.startActivityIndicator()
            }
            else
            {
                self?.stopActivityIndicator()
            }
        }
    }
    
    // MARK: - Programmaticall UI Functions
    func setupSearchField()
    {
        txtSearchField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(txtSearchField)
        txtSearchField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        txtSearchField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40.0).isActive = true
        txtSearchField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0).isActive = true
        txtSearchField.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        txtSearchField.placeholder = "Search here"
        
        // Underlining TextField
        txtSearchField.OvalStyled(height: 25.0)
        txtSearchField.setLeftPadding(pad: 20.0)
    }
    
    func setupTableView()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: txtSearchField.bottomAnchor, constant: 50.0).isActive = true
    }
}

