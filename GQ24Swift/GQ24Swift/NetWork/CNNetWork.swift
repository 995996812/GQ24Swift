//
//  CNNetWork.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/15.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessBlock = (_ obj: Dictionary<String, AnyObject>)->()
typealias ErrorBlock   = (_ error: NSError)->()

enum RequsetType: String
{
    case GET
    case POST
}

protocol CNRequestSender {
    
    var host: String { get }

}

extension CNRequestSender{
    
    var host: String{
        return "http://gq24v4.test.gq.com.cn/"
    }
}

struct CNURLSessionRequest: CNRequestSender{
    
    func senderGETRequest(url: String,params: [String: Any] , success: @escaping SuccessBlock, failed: @escaping ErrorBlock){
        
        Alamofire.request(host + url,parameters: params).responseJSON { (DataResponse) in
            
            switch DataResponse.result{
            case .success:
                
                success(DataResponse.result.value as! Dictionary<String, AnyObject>)
                
                break
                
            case .failure:
                failed(DataResponse.result.error as! NSError)
                break
                
            }
//            if DataResponse.result.value != nil{
//                
//                success(DataResponse.result.value as! Dictionary<String, AnyObject>)
//                
//            }else{
//                failed(DataResponse.result.error as! NSError)
//            }
        }
    }
    
    func senderPOSTRequest(url: String,param: [String: Any],success: @escaping SuccessBlock, failed: @escaping ErrorBlock){
        
        Alamofire.request(host + url,method: .post,parameters: param).responseJSON { (DataResponse) in
            switch DataResponse.result{
                
            case .success:
                success(DataResponse.result.value as! Dictionary<String, AnyObject>)
                break
                
            case .failure:
                failed(DataResponse.result.error as! NSError)
                break
                
            }
        }
    }
}





