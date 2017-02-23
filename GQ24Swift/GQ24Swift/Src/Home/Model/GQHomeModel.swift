//
//  GQHomeModel.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2017/2/21.
//  Copyright © 2017年 condentast. All rights reserved.
//

import UIKit
import MJExtension

class GQHomeModel: NSObject {
    
    var numid: UInt = 0
    
    var cmsid: UInt = 0
    
    var coltype: UInt = 0
    
    var title: String = ""
    
    var colname: String = ""
    
    var date: String = ""
    
    var coverimg: String = ""
    
    var popinfo: Array<Any> = []
    
}

extension GQHomeModel{
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        
        return ["popinfo": GQHomeItemModel.self]
    }
    
}

class GQHomeItemModel: NSObject {
    
    var title: String = ""
    
    var img: String = ""
    
}

class GQActivityModel: NSObject {
    
    var type: UInt = 0
    
    var numid: UInt = 0
    
    var date: String = ""
    
    var img: String = ""
    
    var url: String = ""
}
