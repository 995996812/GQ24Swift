//
//  GQBaseTabBarController.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/21.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit

class GQBaseTabBarController: UITabBarController{
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("1111")
        self.setTabBarAttributes()
        self.setNavigationControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension GQBaseTabBarController: UITabBarControllerDelegate{
    
    func setTabBarAttributes(){
        self.tabBar.backgroundColor = UIColor.black
        self.tabBar.backgroundImage = UIImage(named: "black_test.png")
        self.tabBar.tintColor = UIColor.white
        let indictorImageSize = CGSize(width: self.tabBar.bounds.size.width / 4, height: self.tabBar.bounds.size.height)
        
        self.tabBar.selectionIndicatorImage = self.drawTabBarItemBackgroundImageWithSize(size: indictorImageSize)
        
        self.delegate = self
    }
    
    func setNavigationControllers(){
        //初始化主频道页面
        let homeVC = GQHomeVC.loadNib(name: "GQHomeVC")
        let HGQRUVC = GQHGQRUVC.loadNib(name: "GQHGQRUVC")
        let findVC = GQDiscoverVC.loadNib(name: "GQDiscoverVC")
        let mineVC = GQMineVC.loadNib(name: "GQMineVC")
        
        homeVC.tabBarItem  = GQTabBarItem(index: 0)
        HGQRUVC.tabBarItem = GQTabBarItem(index: 1)
        findVC.tabBarItem  = GQTabBarItem(index: 2)
        mineVC.tabBarItem  = GQTabBarItem(index: 3)
        
        let homeNav = GQBaseNavigationController.init(rootViewController: homeVC)
        let HGQRUNav = GQBaseNavigationController.init(rootViewController: HGQRUVC)
        let findNav = GQBaseNavigationController.init(rootViewController: findVC)
        let mineNav = GQBaseNavigationController.init(rootViewController: mineVC)
        self.viewControllers = [homeNav, HGQRUNav, findNav, mineNav]
    }
    
    func drawTabBarItemBackgroundImageWithSize(size: CGSize) -> UIImage{
        UIGraphicsBeginImageContext(size)
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.setFillColor(red: 229.0/255.0, green: 30.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        ctx!.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
