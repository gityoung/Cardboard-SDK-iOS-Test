//
//  AppDelegate.m
//  TestCD
//
//  Created by young on 16/5/9.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "AppDelegate.h"
#import "NewPlayerVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)setupRootVC{
    NewPlayerVC *rootVC = [NewPlayerVC new];
    self.window.rootViewController = rootVC;
    [UIApplication sharedApplication].statusBarHidden = YES;
   
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self setupRootVC];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
