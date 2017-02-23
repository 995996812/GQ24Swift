//
//  GQHomeVM.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2017/2/21.
//  Copyright © 2017年 condentast. All rights reserved.
//

import UIKit
import MJExtension


class GQHomeVM: NSObject {
    
    class func requestHomeData(params: [String: Any], successBlock: @escaping (_ result: Any)->(), failedBlock: @escaping (_ error: NSError)->()){
        
        CNURLSessionRequest().senderGETRequest(url: "gq24/api40/getindexdata",params: params,success: { (result) in
            
            guard let data = result["data"] as? [NSDictionary] else{
                
                return;
            }
            
            var dataArr: [AnyObject] = []
            
            for dict in data{
                
                let dataType: UInt = dict["datatype"] as! UInt
                
                switch dataType {
                    
                case 0:
                    dataArr.append("0" as AnyObject)
                    break
                    
                case 1:
                    let homeModel = GQHomeModel.mj_object(withKeyValues: dict["datainfo"])
                    dataArr.append(homeModel!)
                    break
                    
                case 2:
                    let activityModel = GQActivityModel.mj_object(withKeyValues: dict["datainfo"])
                    dataArr.append(activityModel!)
                    break
                default:
                    break
                }
            }
            
            successBlock(dataArr);
            
        }) { (error) in
            
            failedBlock(error);
        }
    }
}
