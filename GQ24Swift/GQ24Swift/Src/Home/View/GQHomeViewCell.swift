//
//  GQHomeViewCell.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/12/16.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit

class GQHomeViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GQHomeViewCell{
    
   public func configData(imgName: String){
        
//    imgView.image = UIImage(named: imgName)
    
//    imageView?.yy_setImage(with: NSURL(string: "http://img3.selfimg.com.cn/activity1080/2016/12/15/1481811640_lAjFH9.jpg") as URL?, options: [.setImageWithFadeAnimation, .progressiveBlur])
    
    imageView?.yy_setImage(with: NSURL(string: "http://img3.selfimg.com.cn/activity1080/2016/12/15/1481811640_lAjFH9.jpg") as URL?, placeholder: nil, options: [.setImageWithFadeAnimation, .progressiveBlur], completion: { ( image,  url, form, stage, error) in
        
    })
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
