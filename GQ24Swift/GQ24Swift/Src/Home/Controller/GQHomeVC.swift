//
//  GQHomeVC.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/21.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit
import YYWebImage
import SwiftyJSON
import MJRefresh

class GQHomeVC: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var imgArr: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    var dataArr: [AnyObject] = []
    var isDropDown: Bool = true
    var articleid: UInt = 0
    var activityid: UInt = 0
    // MARK: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
    
        requestNetWork()
        configTableView()
        setRefresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension GQHomeVC{
    // MARK: - 私有方法
    
    func requestNetWork(){
        
        if self.isDropDown == true {
            self.articleid = 0
            self.activityid = 0
        }
        
        let params = ["articleid": self.articleid,"activityid":self.activityid]
        
        GQHomeVM.requestHomeData(params: params, successBlock: { (result) in
            
            if self.isDropDown == true{
                
                self.dataArr = result as! [AnyObject]
                self.stopRefreshTableView()
            }else{
                
                let arr: [AnyObject] = result as! [AnyObject]
                
                self.dataArr = self.dataArr + arr
                
                if arr.isEmpty {
                    
                    self.tableView.mj_footer.endRefreshingWithNoMoreData()
                }else{
                    self.stopRefreshTableView()
                }
            }
            print(self.dataArr)
            self.refreshTheArticleId(array: self.dataArr)
            self.tableView.reloadData()
            
        }) { (error) in

            print(error)
        }
    }
    // MARK: 刷新id
    func refreshTheArticleId(array: [AnyObject]) {
        
        var articleidArr: [AnyObject] = []
        var activityidArr: [AnyObject] = []
     
        for model in array {
          
            if (model.self).isKind(of: GQHomeModel.self){
                
                articleidArr.append(model)
                
            } else if (model.self).isKind(of: GQActivityModel.self) {
                activityidArr.append(model)
            }
        }
        
        if articleidArr.count > 0 {
            
            let homeModel: GQHomeModel = articleidArr[articleidArr.count - 1] as! GQHomeModel;
            
            self.articleid = homeModel.numid
            
        }
        
        if activityidArr.count > 0 {
            
            let activiModel: GQActivityModel = activityidArr[activityidArr.count - 1] as! GQActivityModel
            
            self.activityid = activiModel.numid
            
        }
    }
    // MARK: - 停止刷新
    func stopRefreshTableView(){
        self.tableView.mj_header.endRefreshing()
        self.tableView.mj_footer.endRefreshing()
    }
    
    // MARK: - 配置tableview
    func configTableView(){
        tableView.rowHeight = 220;
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "GQHomeViewCell", bundle: nil), forCellReuseIdentifier: "GQHomeViewCell")
    }
    // MARK: - 设置上拉下拉
    func setRefresh() {
        
        tableView.mj_header = MJRefreshStateHeader.init(refreshingBlock: {
            
            self.isDropDown = true
            self.requestNetWork()
        })
        
        tableView.mj_footer = MJRefreshBackStateFooter.init(refreshingBlock: {
            
            self.isDropDown = false
            
            self.requestNetWork()
        })
    }
}

extension GQHomeVC: UITableViewDataSource{
    //MARK: - 生命周期方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollViewDidScroll(UIScrollView())
    }
    
    // MARK: - 数据源 代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GQHomeViewCell") as! GQHomeViewCell
      
        cell.configData(data: self.dataArr[indexPath.row])
        
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
