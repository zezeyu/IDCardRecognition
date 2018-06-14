//
//  CADAlertControllerTool.h
//  cheanda
//
//  Created by 申露露 on 2018/4/16.
//  Copyright © 2018年 车安达. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define cancelIndex    (-1)

typedef void(^CADAlertControllerToolBlock)(NSInteger buttonTag);

@interface CADAlertControllerTool : NSObject
+ (CADAlertControllerTool *)sharedInstance;
- (void)showAlert:(NSString *)title
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle
       titleArray:(NSArray *)titleArray
   viewController:(UIViewController *)vc
          confirm:(CADAlertControllerToolBlock)confirm;
@end
