//
//  YuHeader.h
//  CarMen
//
//  Created by young on 16/4/27.
//  Copyright © 2016年 Young. All rights reserved.
//

#ifndef YuHeader_h
#define YuHeader_h

#ifdef DEBUG
# define DebugLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]\n""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DebugLog(...);
#endif

#define SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define YU_COLOR_TEXT_NORMAL [UIColor whiteColor]
#define YU_SIZE_FONT_SMALL  [UIFont systemFontOfSize:14.f]
#define YU_SIZE_FONT_NORMAL  [UIFont systemFontOfSize:18.f]
#define YU_SIZE_FONT_BOLD    [UIFont boldSystemFontOfSize:18.f]

#define YU_SIZE_FONT_BIG  [UIFont systemFontOfSize:32.f]
#define YU_COLOR_BG_DEFAULT [[UIColor blackColor] colorWithAlphaComponent:0.25]

#define YU_Margin 16
#define Alert(_S_, ...) [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]


#define TICK   CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCK   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
#endif /* YuHeader_h */
