//
//  UIViewController+Runtime.m
//  TestCD
//
//  Created by young on 16/5/11.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "UIViewController+Runtime.h"
#import <objc/runtime.h>
@implementation UIViewController (Runtime)


//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

- (void)LogAllMethodsFromClass:(id)obj
{
    u_int count;
    //class_copyMethodList 获取类的所有方法列表
    Method *mothList_f = class_copyMethodList([obj class],&count) ;
    for (int i = 0; i < count; i++) {
        Method temp_f = mothList_f[i];
        // method_getImplementation  由Method得到IMP函数指针
//        IMP imp_f = method_getImplementation(temp_f);
        
        // method_getName由Method得到SEL
        SEL name_f = method_getName(temp_f);
        
        const char * name_s = sel_getName(name_f);
        // method_getNumberOfArguments  由Method得到参数个数
        int arguments = method_getNumberOfArguments(temp_f);
        // method_getTypeEncoding  由Method得到Encoding 类型
        const char * encoding = method_getTypeEncoding(temp_f);
        
        NSLog(@"方法名：%@\n,参数个数：%d\n,编码方式：%@\n",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
    
}

- (NSArray *)getAllProperties:(id)obj
{
    u_int count;
    
    //使用class_copyPropertyList及property_getName获取类的属性列表及每个属性的名称
    
    objc_property_t *properties  =class_copyPropertyList([obj class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
         NSLog(@"属性%@\n",[NSString stringWithUTF8String: propertyName]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

- (NSString *)getTheClassName:(id)obj
{
    NSString *className = [NSString stringWithCString:object_getClassName(obj)encoding:NSUTF8StringEncoding];
    NSLog(@"类名 =%@",className);
    
    return className;
}
@end
