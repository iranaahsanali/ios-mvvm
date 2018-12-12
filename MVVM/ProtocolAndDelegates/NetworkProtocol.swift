//
//  NetworkProtocol.swift
//  MVVM
//
//  Created by Ahsan Ali on 10/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation

// This file is the generic Protocol for calling API's.
// Any class that will hit API's will implement these protocols
protocol NetworkProtocol{
    func apiCallBack(apiName:String , apiResponse:[String : AnyObject])
}
