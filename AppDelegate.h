//
//  AppDelegate.h
//  侧边栏
//
//  Created by 周都 on 16/7/6.
//  Copyright © 2016年 周都. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/**
 *  左边框栏
 */
@property (nonatomic, strong) LeftViewController *leftViewController;


@end

