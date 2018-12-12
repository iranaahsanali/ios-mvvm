//
//  Employee.swift
//  MVVM
//
//  Created by Ahsan Ali on 11/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation


public class Employee {
    public var id : String?
    public var employee_name : String?
    public var employee_salary : String?
    public var employee_age : String?
    public var profile_image : String?
    
    public class func modalFromJSONArray(array:NSArray) -> [Employee]
    {
        var models:[Employee] = []
        for item in array
        {
            models.append(Employee(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? String
        employee_name = dictionary["employee_name"] as? String
        employee_salary = dictionary["employee_salary"] as? String
        employee_age = dictionary["employee_age"] as? String
        profile_image = dictionary["profile_image"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.employee_name, forKey: "employee_name")
        dictionary.setValue(self.employee_salary, forKey: "employee_salary")
        dictionary.setValue(self.employee_age, forKey: "employee_age")
        dictionary.setValue(self.profile_image, forKey: "profile_image")
        
        return dictionary
    }
    
}

