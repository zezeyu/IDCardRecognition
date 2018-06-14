//
//  IDInfoViewController.h
//  IDCardRecognition
//
//  Created by 何泽的mac on 2018/6/14.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IDInfo;
   
@interface IDInfoViewController : UIViewController

// 身份证信息
@property (nonatomic,strong) IDInfo *IDInfo;

// 身份证图像
@property (nonatomic,strong) UIImage *IDImage;

@end
