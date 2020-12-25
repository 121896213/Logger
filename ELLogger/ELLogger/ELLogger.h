//
//  ELLogger.h
//  ELLogger
//
//  Created by 小细菌 on 2020/12/9.
//

#import <Foundation/Foundation.h>

//直接调用此宏定义进行写日志  ,用法与NSLog一致
#define GXLog(...)    [ELLogger.sharedManager log:__VA_ARGS__]
 
 
@interface ELLogger : NSObject

+ (ELLogger *)sharedManager;

//默认YES . 设为No关闭写文本日志功能
- (void)setLogger:(BOOL)open;

//写日志函数
- (void)log: (NSString *)format, ... NS_FORMAT_FUNCTION(1, 2) ;

//获取log页面vc
+ (id)getLoggerViewController;

//获取log存储路径
+ (NSArray*)getLogPath;

//清空所有log
+ (void)cleanLogger;
@end

 
