//
//  LeftViewController.m
//  侧边栏
//
//  Created by 周都 on 16/7/6.
//  Copyright © 2016年 周都. All rights reserved.
//

#import "LeftViewController.h"
#import <objc/runtime.h>
@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)rootViewController:(UIViewController *)rootViewController {
    
    
    objc_setAssociatedObject(self, @"navigation", rootViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    self.view.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:240.0 / 255 blue:240.0 / 255 alpha:1];
    
    
    [self.view addSubview:rootViewController.view];
    
    UIPanGestureRecognizer *screenPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanGesture:)];
    
    
    
    
    [rootViewController.view addGestureRecognizer:screenPan];
    
    
   
    
    
    
    
}



- (void)screenEdgePanGesture:(UIPanGestureRecognizer *)sender {
    
        UIViewController *controller = objc_getAssociatedObject(self, @"navigation");
        
        CGPoint point = [sender translationInView:controller.view];
        
        
    if (sender.state == UIGestureRecognizerStateBegan) {
        direction = kCameraMoveDirectionNone;
        
    } else if (sender.state == UIGestureRecognizerStateChanged && direction == kCameraMoveDirectionNone) {
        
        
        direction = [self determineCameraDirectionIfNeeded:point];
        
        switch (direction) {
            case kCameraMoveDirectionNone:
            {
                
                
            }
                break;
                
                case kCameraMoveDirectionUp:
            {
                
                
            }
                break;
            
                case kCameraMoveDirectionRight:
            {
                
                
            }
                break;
                
                case kCameraMoveDirectionLeft:
            {
                
            }
                break;
                
            case kCameraMoveDirectionDown:{
                
            }
                break;
                
            default:
                break;
        }
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        
        
        
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
