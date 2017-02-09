//
//  GQHomeVC.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/21.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit
import YYWebImage

class GQHomeVC: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var imgArr: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    // MARK: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CNURLSessionRequest().senderGETRequest(url: "gq24/api40/getindexdata", success: {(obj) in
            
            guard var data = obj["data"] as? [NSDictionary] else{
               
                return;
            }
            
            print(data)
            
        }, failed: {(error) in
            
            print(error)
        })
        
        configTableView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension GQHomeVC{
    // MARK: - 私有方法
    func configTableView(){
        tableView.rowHeight = 200;
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "GQHomeViewCell", bundle: nil), forCellReuseIdentifier: "GQHomeViewCell")
    }
}

extension GQHomeVC: UITableViewDataSource{
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollViewDidScroll(UIScrollView())
    }
    
    // MARK: - 数据源 代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GQHomeViewCell") as! GQHomeViewCell
        
        cell.configData(imgName: imgArr[indexPath.row]);
        
        return cell
    }
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //获取可见cell
        let visibleCells = self.tableView.visibleCells
        for visibleCell  in visibleCells {
            
            let cell = visibleCell as! GQHomeViewCell
            
            cell.cellOnTableView(tableView: self.tableView, didScrollView: self.view)
            
        }
    }
}
