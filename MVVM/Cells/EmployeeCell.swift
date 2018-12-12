//
//  EmployeeCell.swift
//  MVVM
//
//  Created by Ahsan Ali on 11/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

class EmployeeCell: UITableViewCell {

    let mainView = UIView()
    let LblID = UILabel()
    let LblName = UILabel()
    let LblSalary = UILabel()
    let LblAge = UILabel()
    let UserImage = UIImageView()
    
    let viewModal = EmployeeCellViewModal()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        bindViewModal()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModal()
    {
        viewModal.id.bind(to: LblID.reactive.text)
        viewModal.name.bind(to: LblName.reactive.text)
        viewModal.salary.bind(to: LblSalary.reactive.text)
        viewModal.age.bind(to: LblAge.reactive.text)
    }
    
    func populateData(viewModal : EmployeeCellViewModal)
    {
        LblID.text = viewModal.id.value
        LblName.text = viewModal.name.value
        LblSalary.text = viewModal.salary.value
        LblAge.text = viewModal.age.value
    }
    
    func setupUI()
    {
        // Main View of Cell
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = UIColor.lightGray
        mainView.layer.cornerRadius = 10.0
        let mainViewConstraints = [
            mainView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
            mainView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10.0),
            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        ]
        NSLayoutConstraint.activate(mainViewConstraints)
        
        // User Profile Pic
        mainView.addSubview(UserImage)
        UserImage.translatesAutoresizingMaskIntoConstraints = false
        let UserImageConstraints = [
            UserImage.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0.0),
            UserImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0.0),
            UserImage.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -25.0),
            UserImage.widthAnchor.constraint(equalTo: UserImage.heightAnchor)
        ]
        UserImage.image = UIImage(named: "Blank-profile.png")
        UserImage.contentMode = .scaleToFill
        UserImage.clipsToBounds = true
        NSLayoutConstraint.activate(UserImageConstraints)

        // Employee ID
        mainView.addSubview(LblID)
        LblID.translatesAutoresizingMaskIntoConstraints = false
        let lblIDConstraints = [
            LblID.leftAnchor.constraint(equalTo: UserImage.leftAnchor, constant : 15.0),
            LblID.heightAnchor.constraint(equalToConstant: 20.0),
            LblID.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant : -10.0)
        ]
        LblID.font = UIFont.systemFont(ofSize: 15.0)
        NSLayoutConstraint.activate(lblIDConstraints)

        // Employee Name
        mainView.addSubview(LblName)
        LblName.translatesAutoresizingMaskIntoConstraints = false
        let lblNameConstraints = [
            LblName.leadingAnchor.constraint(equalTo: UserImage.trailingAnchor, constant: 10.0),
            LblName.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10.0),
            LblName.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10.0),
            LblName.heightAnchor.constraint(equalToConstant: 40.0)
        ]
        LblName.font = UIFont.systemFont(ofSize: 25.0)
        LblName.adjustsFontSizeToFitWidth = true
        LblName.minimumScaleFactor = 0.5
        NSLayoutConstraint.activate(lblNameConstraints)

        // Employee Age
        mainView.addSubview(LblAge)
        LblAge.translatesAutoresizingMaskIntoConstraints = false
        let lblAgeConstraints = [
            LblAge.leadingAnchor.constraint(equalTo: UserImage.trailingAnchor, constant: 10.0),
            LblAge.topAnchor.constraint(equalTo: LblName.bottomAnchor, constant: 5.0),
            LblAge.heightAnchor.constraint(equalToConstant: 25.0)
        ]
        LblAge.font = UIFont.systemFont(ofSize: 20.0)
        NSLayoutConstraint.activate(lblAgeConstraints)

        // Employee Salary
        mainView.addSubview(LblSalary)
        LblSalary.translatesAutoresizingMaskIntoConstraints = false
        let lblSalaryConstraints = [
            LblSalary.leadingAnchor.constraint(equalTo: UserImage.trailingAnchor, constant: 10.0),
            LblSalary.topAnchor.constraint(equalTo: LblAge.bottomAnchor, constant: 5.0),
            LblSalary.heightAnchor.constraint(equalToConstant: 25.0)
        ]
        LblSalary.font = UIFont.systemFont(ofSize: 20.0)
        NSLayoutConstraint.activate(lblSalaryConstraints)

    }

}
