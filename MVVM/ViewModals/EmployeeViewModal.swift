//
//  EmployeeViewModal.swift
//  MVVM
//
//  Created by Ahsan Ali on 11/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

class EmployeeViewModal : NetworkProtocol
{
    // For API handling
    let apiManager = NetworkManager()

    // Observable Field that conforms with UI
    let searchString = Observable<String?>("")
    let validSearchText = Observable<Bool>(false)
    
    // For Loading
    var isLoading: Bool = true {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var updateLoadingStatus: (()->())?

    let data : MutableObservableArray = MutableObservableArray<Employee>()
    lazy var cellViewModals : MutableObservableArray = MutableObservableArray<EmployeeCellViewModal>()
    
    
    init() {
        searchString.value = ""
        
        /// Observe String Here
        _ = searchString.observeNext(with: {text in
            self.validSearchText.value = text?.count ?? 0  >= 4 ? true : false
            if self.validSearchText.value
            {
                let filterdItems = self.cellViewModals.array.filter({ ($0.name.value?.contains(text!) ?? false) })
                self.cellViewModals.replace(with: filterdItems)
            }
            else if text?.count == 0
            {
                self.cellViewModals.replace(with: self.data.array.map({ return EmployeeCellViewModal().populateData(employee: $0) }))
            }
        })
        fetchEmployees()
    }
    
    // MARK:- API Call to fetch employees list
    func fetchEmployees()
    {
        // set activity indictor status on
        isLoading = true
        
        let url:String = ApiLinks.fetchEmployees
        // Set Params & Header Values if required
        //let params = Constants.dictionaryStandard()
        //let header = Constants.dictionaryStandard()
        self.apiManager.updateInitialization(link: url, notificationName: url, params: Constants.dictionaryStandard(), header: Constants.dictionaryStandard(), addUSerID: false)
        self.apiManager.delegate = self
        self.apiManager.getAPICall()
    }
    
    func apiCallBack(apiName: String, apiResponse: [String : AnyObject]) {
        if apiName == ApiLinks.fetchEmployees
        {
            isLoading = false
            if let employeesData = apiResponse["data"] as? NSArray
            {
                let employees = Employee.modalFromJSONArray(array: employeesData)
                data.insert(contentsOf: employees, at: 0)
                cellViewModals.insert(contentsOf: data.array.map({ return EmployeeCellViewModal().populateData(employee: $0) }), at: 0)
            }
        }
    }
}
