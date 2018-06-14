//
//  CADAlertControllerTool.m
//  cheanda
//
//  Created by 申露露 on 2018/4/16.
//  Copyright © 2018年 车安达. All rights reserved.
//

#import "CADAlertControllerTool.h"

#define RootVC  [[UIApplication sharedApplication] keyWindow].rootViewController

@interface CADAlertControllerTool ()

@property (nonatomic, copy) CADAlertControllerToolBlock block;

@end

@implementation CADAlertControllerTool
+ (CADAlertControllerTool *)sharedInstance{
    static CADAlertControllerTool * _sharedInstance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}
- (void)showAlert:(NSString *)title
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle
       titleArray:(NSArray *)titleArray
   viewController:(UIViewController *)vc
          confirm:(CADAlertControllerToolBlock)confirm{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (!cancelTitle || cancelTitle.length == 0) {
        
    } else {
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (confirm) {
                confirm(-1);
            }
        }];
        [alertVC addAction:cancel];
    }
    
    if (!titleArray || titleArray.count == 0) {

    } else {
        for (int i = 0; i < titleArray.count; i++) {
            UIAlertAction * sure = [UIAlertAction actionWithTitle:titleArray[i] style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                if (confirm) {
                    confirm(i);
                }
            }];
            [alertVC addAction:sure];
        }
    }
    if (!vc) {
        vc = RootVC;
    }
     [vc presentViewController:alertVC animated:YES completion:nil];
}
@end
