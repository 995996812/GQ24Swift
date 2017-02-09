//
//  GQTabBarItem.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/21.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit

enum Channel: Int{
    case First = 0
    case Second = 1
    case Third = 2
    case Four = 3
}

class GQTabBarItem: UITabBarItem {

    init(index: Int) {
        super.init()
        self.setTabBarItems(index: Channel(rawValue: index)!)
        self.setTitlesAttributes()
        self.setTitlesOffset(offset: UIOffsetMake(0, -10))
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MRAK: - private method
    func setTabBarItems(index: Channel){
        self.tag = index.rawValue
        switch index {
        case Channel.First:
            self.setImage(image: UIImage(named: "gq_gq24"), selectedImage: nil)
            break
            
        case Channel.Second:
            self.setImage(image: UIImage(named: "gq_camera"), selectedImage: nil)
            break
            
        case Channel.Third:
            self.setImage(image: UIImage(named: "gq_found"), selectedImage: nil)
            break
            
        case Channel.Four:
            self.setImage(image: UIImage(named: "gq_mine"), selectedImage: nil)
            break
        }
        self.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
    }
    
    
    func setImage(image: UIImage?, selectedImage: UIImage?){
        self.image = image
        self.selectedImage = selectedImage
    }
    
    func setTitlesOffset(offset: UIOffset){
        //setTitlePositionAdjustment
        UITabBarItem.appearance().titlePositionAdjustment = offset;
        
    }
    
    func setTitlesAttributes(){
        self.setTitleTextAttributes([NSForegroundColorAttributeName: kColorTabBarNormal], for: .normal)
        self.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .selected)
    }
}
