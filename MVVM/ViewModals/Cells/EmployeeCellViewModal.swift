//
//  EmployeeCellViewModal.swift
//  MVVM
//
//  Created by Ahsan Ali on 11/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class EmployeeCellViewModal {
    
    let image = Observable<UIImage?>(UIImage.init(named: "Blank-profile.png"))
    let id = Observable<String?>("")
    let name = Observable<String?>("")
    let age = Observable<String?>("")
    let salary = Observable<String?>("")
    
    func populateData(employee : Employee) -> EmployeeCellViewModal
    {
        if let id = employee.id
        {
            self.id.value = "Emp ID:\(id)"
        }
        if let name = employee.employee_name
        {
            self.name.value = "Name: \(name)"
        }
        if let age = employee.employee_age
        {
            self.age.value = "Age: \(age)"
        }
        if let salary = employee.employee_salary
        {
            self.salary.value = "Salary: \(salary)"
        }
        return self
    }
}
