//
//  NetworkManager.swift
//  MVVM
//
//  Created by Ahsan Ali on 06/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager: NSObject {
    
    private var link:String = ""
    var notificationName:String = ""
    private var params = [String : String]()
    private var header = [String : String]()
    var delegate : NetworkProtocol!
    let activityIndicator = ActivityVC()
    
    public var apiCallType = ""
    
    override init() {
        super.init()
    }
    
    init(link:String ,notificationName:String , params:[String : String] , header:[String : String] , addUSerID:Bool)
    {
        super.init()
        self.link = Constants.baseUrl+link
        self.notificationName = notificationName
        self.params = params
        self.header = header
    }
    
    public func updateInitialization(link:String ,notificationName:String , params:[String : String] , header:[String : String] , addUSerID:Bool) -> Void
    {
        self.link = Constants.baseUrl+link
        self.notificationName = notificationName
        self.params = params
        self.header = header
    }
    
    
    public func reloadAPIFunction(){
        
        if apiCallType == "GET"{
            self.getAPICall()
        }else if apiCallType == "POST"{
            self.postAPICall()
        }
        
    }
    
    public func getAPICall() ->Void
    {
        print("Link : \(link)")
        print("header : \(header)")
        print("params : \(params)")
        
        Alamofire.request(link, method: .get, parameters: params, headers: header).response
            {
                response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Error: \(String(describing: response.error))")
                print("Data: \(String(describing: response.data))")
                
                if((response.error) != nil){
                    
                    var responseJSON = Constants.jsonStandard()
                    responseJSON["message"] = "-11" as AnyObject
                    self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: responseJSON)
                    
                }else{
                    
                    let statusCode = (response.response?.statusCode)!
                    print("Status Code \(statusCode)")
                    
                    do
                    {
                        let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers)
                        // print("The Original Data is :: \(responseJSON)")
                        if responseJSON is NSArray
                        {
                            var finalResponse = Constants.jsonStandard()
                            finalResponse["data"] = responseJSON as! NSArray
                            self.delegate.apiCallBack(apiName: self.notificationName, apiResponse:finalResponse)
                        }
                        else
                        {
                            self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: (responseJSON as! Constants.jsonStandard))
                        }
                        
                    }
                    catch
                    {
                        let resstr = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                        print(String(describing: resstr))
                        print(error)
                    }
                    
                }
                
        }
        
        
    }
    
    public func postAPICall() ->Void
    {
        
        let request = Alamofire.request(link, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
        //   let validation = request.validate()
        print("\(params)")
        request.response
            {
                response in
                
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Error: \(String(describing: response.error))")
                //print("Data: \(String(describing: response.data))")
                
                if((response.error) != nil){
                    
                    var responseJSON = Constants.jsonStandard()
                    responseJSON["msg"] = "Something went wrong while fetching data from server." as AnyObject
                    let errorString = response.error?.localizedDescription
                    if((errorString?.characters.count)! > 0){
                        responseJSON["message"] = errorString! as AnyObject
                    }
                    self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: responseJSON)
                    
                }else{
                    
                    let statusCode = (response.response?.statusCode)!
                    print("         ----------------    The Status Code     --------    \(statusCode)")
                    
                    do
                    {
                        let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! Constants.jsonStandard
                        //print("The Original Data is :: \(responseJSON)")
                        self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: responseJSON)
                    }
                    catch
                    {
                        
                        let resstr = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                        print("Bismillah, Simple Server String :: \(String(describing: resstr))")
                        print(error)
                    }
                }
                
        }
        
    }
    
    
}
