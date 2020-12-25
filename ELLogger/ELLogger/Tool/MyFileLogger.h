//
//  MyFileLogger.h
//  MobileProject  日志记录
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>
#import "MPLoggerFormatter.h"
 

 

//static  DDLogLevel ddLogLevel = LOG_LEVEL_VERBOSE;

//#define NSLog(...) DDLogInfo(__VA_ARGS__)
 

@interface MyFileLogger : NSObject
@property (nonatomic, strong, readwrite) DDFileLogger *fileLogger;

+(MyFileLogger *)sharedManager;

@end
