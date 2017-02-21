//
//  UIImage+GQImage.h
//  GQ24Swift
//
//  Created by 王鹏华 on 2017/2/21.
//  Copyright © 2017年 condentast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GQImage)

- (UIColor *)mostColor;

- (BOOL)isLightColor:(UIColor*)clr;
@end
