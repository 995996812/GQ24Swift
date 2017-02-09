//
//  UIViewController+Nib.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/21.
//  Copyright © 2016年 condentast. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    public class func loadNib(name: String) -> Self{
        
        return self.init(nibName: name,bundle: nil)
        
    }
    
    func setNavigationBarTitleTextAttributes(font: UIFont, tintColor: UIColor){
        
        let textAttributes: NSDictionary = NSDictionary(objects: [font,tintColor], forKeys: [NSFontAttributeName as NSCopying,NSForegroundColorAttributeName as NSCopying]);
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as? [String : Any]
    }
}
