//
//  UIViewController+Runtime.h
//  TestCD
//
//  Created by young on 16/5/11.
//  Copyright © 2016年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Runtime)
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC;
//获取类名
- (void)LogAllMethodsFromClass:(id)obj;
//
- (NSArray *)getAllProperties:(id)obj;
- (NSString *)getTheClassName:(id)obj;

@end
