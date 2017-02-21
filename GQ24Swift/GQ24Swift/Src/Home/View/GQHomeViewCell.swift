//
//  GQHomeViewCell.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/12/16.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit
import SwiftyJSON

class GQHomeViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var storeName: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {}
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {}
    
}

extension GQHomeViewCell{
    
   public func configData(json: JSON){
    
    self.nameLabel.font = UIFont(name: "Helvetica-Bold", size: 22)
    self.storeName.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
    
    if let coverimg = json["datainfo"]["coverimg"].string{
        
        imgView?.yy_setImage(with: NSURL(string: coverimg) as URL?, placeholder: nil, options: [.setImageWithFadeAnimation, .progressiveBlur], completion: { ( image,  url, form, stage, error) in
            
            if (image != nil){
                //用异步的方式运行队列里地任务
                let globQueue = DispatchQueue.global()
                globQueue.async {
                    
                    let color = image?.mostColor()
                    
                    DispatchQueue.main.async(execute: {
                        if (image?.isLightColor(color))! {
                            
                            self.nameLabel.textColor = UIColor.red
                        }else{
                           
                            self.nameLabel.textColor = UIColor.yellow
                        }
                    })
                }
            }
        })
        
    }else{
        
        imgView.image = UIImage(named: "1")
    }
    
    if let colname = json["datainfo"]["colname"].string{
        storeName.setTitle(colname, for: .normal)
        storeName.isHidden = false;
    }else{
        storeName.isHidden = true;
    }
    
    if let title = json["datainfo"]["title"].string{
        
        nameLabel.text = title;
        nameLabel.isHidden = false;
    }else{
        nameLabel.isHidden = true;
    }
    
    
}
    
    public func cellOnTableView(tableView: UITableView, didScrollView: UIView){
        //获取每个cell的位置(为了获取每个cell的Y值)
        let rect: CGRect = tableView.convert(self.frame, to: didScrollView)
        //获取每个可见cell距离中心点的值
        let distanceCenter: CGFloat = didScrollView.frame.height / 2 - rect.minY
        //图片高度
        let difference: CGFloat = self.imgView.frame.height - self.frame.height
        
        let imgMove = (distanceCenter / didScrollView.frame.height) * difference
        //旧的图片的frame
        var imageRect: CGRect = self.imgView.frame
        //移动
        imageRect.origin.y = imgMove - (difference / 2)
        //新的图片frame
        self.imgView.frame = imageRect
    }
    
    
}
