//
//  LeftViewController.m
//  侧边栏
//
//  Created by 周都 on 16/7/6.
//  Copyright © 2016年 周都. All rights reserved.
//

#import "LeftViewController.h"
#import <objc/runtime.h>
#define kMainScreenFrameRect    [[UIScreen mainScreen] bounds]
#define kMainScreenWidth     kMainScreenFrameRect.size.width
@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)rootViewController:(UIViewController *)rootViewController {
    
    
    objc_setAssociatedObject(self, @"navigation", rootViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    rootViewController.view.layer.shadowColor = [UIColor colorWithRed:120.0 / 255 green:120.0 / 255 blue:120.0 / 255 alpha:1].CGColor;
    rootViewController.view.layer.shadowOpacity = 0.8;
    
    rootViewController.view.layer.shadowOffset = CGSizeMake(-5, 0);
    
    
    self.view.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:240.0 / 255 blue:240.0 / 255 alpha:1];
    
    
    [self.view addSubview:rootViewController.view];
    
    UIPanGestureRecognizer *screenPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanGesture:)];
    
    
    
    
    [rootViewController.view addGestureRecognizer:screenPan];
    
    
   
    
    
    
    
}



- (void)screenEdgePanGesture:(UIPanGestureRecognizer *)sender {
    
        UIViewController *controller = objc_getAssociatedObject(self, @"navigation");
        
        CGPoint point = [sender translationInView:self.view];
        
   
    
   
     NSLog(@"🐈，%@", NSStringFromCGPoint(point));

    if (sender.state == UIGestureRecognizerStateBegan) {
    
        
         CGPoint point1 = [sender locationInView:controller.view];
        
        if (point1.x < 100) {
            
            objc_setAssociatedObject(self, _cmd, @1, OBJC_ASSOCIATION_ASSIGN);
            
            
            
        } else {
            
             objc_setAssociatedObject(self, _cmd, @0, OBJC_ASSOCIATION_ASSIGN);
            
            
        }
        
    }
    
    
    /**
     *  满足指定区域
     */
    if ([objc_getAssociatedObject(self, _cmd) integerValue]) {
        
        
        
    
    CGFloat xCount = point.x + kMainScreenWidth * 0.5;
    
    
    if ((xCount > kMainScreenWidth * 0.5) && xCount < 1.3 * kMainScreenWidth) {
        
        CGPoint nowPoint = controller.view.center;
        
        nowPoint.x = point.x + kMainScreenWidth * 0.5;
        
        controller.view.center = nowPoint;
        
        
        
    } else if(xCount > 1.3 * kMainScreenWidth){
        
        
        CGPoint nowPoint = controller.view.center;
        
        nowPoint.x = 1.3 * kMainScreenWidth;
        
        controller.view.center = nowPoint;
        
        
    } else if (xCount < 0.5 * kMainScreenWidth && point.x < 0){
        
        
        CGPoint nowPoint = controller.view.center;
        
        nowPoint.x = 1.3 * kMainScreenWidth + point.x;
        
        controller.view.center = nowPoint;
        
        
    } else if (xCount < 0.5 * kMainScreenWidth){
        
        
        CGPoint nowPoint = controller.view.center;
        
        nowPoint.x = 0.5 * kMainScreenWidth;
        
        controller.view.center = nowPoint;
    }
        
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"🐯");
        
        
        if (xCount >=  kMainScreenWidth) {
            
            CGPoint nowPoint = controller.view.center;
            
            nowPoint.x = 1.3 * kMainScreenWidth;
            
[UIView animateWithDuration:0.15 animations:^{
   
    controller.view.center = nowPoint;

    
    
}];
            
            
            
        } else {
            
            
            
            CGPoint nowPoint = controller.view.center;
            
            nowPoint.x = 0.5 * kMainScreenWidth;
            
            [UIView animateWithDuration:0.15 animations:^{
                
                controller.view.center = nowPoint;
                
                
                
            }];
            

            
            
        }
        
        
    }
    
    }
    
    
}




- (CameraMoveDirection)determineCameraDirectionIfNeeded:(CGPoint)translation
{
    if (direction != kCameraMoveDirectionNone)
        return direction;
    
    if (fabs(translation.x) > gestureMinimumTranslation){
        BOOL gestureHorizontal = NO;
        if (translation.y == 0.0)
            gestureHorizontal = YES;
        else
            gestureHorizontal = (fabs(translation.x / translation.y) > 5.0);
        
        if(gestureHorizontal){
            if (translation.x > 0.0)
                return kCameraMoveDirectionRight;
            else
                return kCameraMoveDirectionLeft;
        }
        
    }else if(fabs(translation.y) > gestureMinimumTranslation){
        BOOL gestureVertical = NO;
        
        if (translation.x == 0.0)
            gestureVertical = YES;
        else
            gestureVertical = (fabs(translation.y / translation.x) > 5.0);
        
        if(gestureVertical){
            if (translation.y > 0.0)
                return kCameraMoveDirectionDown;
            else
                return kCameraMoveDirectionUp;
        }
    }
    return direction;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
