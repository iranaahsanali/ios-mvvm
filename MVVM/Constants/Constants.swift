//
//  Constants.swift
//  MVVM
//
//  Created by Ahsan Ali on 06/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation

struct Constants
{
    // Base URL for API Calls
    static let baseUrl:String = "http://dummy.restapiexample.com/api/v1/"
    // Application Key
    static let appKey:String = "s89io90009ii890--0-9-"
    //Application ID
    static let appId:String = "0"
    // User Session Hash/ Token
    static let token:String = "sessionHash"
    
    // Alias
    typealias jsonStandard = [String : AnyObject]
    typealias dictionaryStandard = [String : String]
}
