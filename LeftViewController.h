//
//  LeftViewController.h
//  侧边栏
//
//  Created by 周都 on 16/7/6.
//  Copyright © 2016年 周都. All rights reserved.
//

#import <UIKit/UIKit.h>

CGFloat const gestureMinimumTranslation = 0.0 ;
CGFloat const gestureMinimumTranslation1 = 20.0 ;

typedef enum : NSInteger {
    /**
     *
     */
    kCameraMoveDirectionNone,
    /**
     *  <#Description#>
     */
    kCameraMoveDirectionUp,
    /**
     *  <#Description#>
     */
    kCameraMoveDirectionDown,
    /**
     *  <#Description#>
     */
    kCameraMoveDirectionRight,
    /**
     *  <#Description#>
     */
    kCameraMoveDirectionLeft
} CameraMoveDirection;




@interface LeftViewController : UIViewController

{
    CameraMoveDirection direction;
}
/**
 *  根视图
 *
 *  @param rootViewController <#rootViewController description#>
 */
- (void)rootViewController:(UIViewController *)rootViewController;


@end
