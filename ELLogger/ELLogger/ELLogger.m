//
//  ELLogger.m
//  ELLogger
//
//  Created by 小细菌 on 2020/12/9.
//

#import "ELLogger.h"
#import "DDLog.h"
#import "MyFileLogger.h"
static  DDLogLevel ddLogLevel = LOG_LEVEL_VERBOSE;

@interface ELLogger()
@property (nonatomic, assign) BOOL openLogger;
@end


@implementation ELLogger


static ELLogger *sharedManager=nil;

+(ELLogger *)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager=[[self alloc]init];
    });
    return sharedManager;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _openLogger = YES;
    }
    return self;
}

- (void)setLogger:(BOOL)open{
    _openLogger = open;
}

- (void)log: (NSString *)format, ... NS_FORMAT_FUNCTION(1, 2) {

    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    if (_openLogger) {
        DDLogInfo(@"%@",str);
    }else{
        NSLog(@"%@",str);
    }
}

+ (id)getLoggerViewController{
    return [NSClassFromString(@"LoggerViewController") new];
}

+ (NSArray*)getLogPath{
     
    return [MyFileLogger sharedManager].fileLogger.logFileManager.sortedLogFilePaths;
}

+ (void)cleanLogger{
    NSArray* logFiles = [self getLogPath];
    for (DDLogFileInfo *logFileInfo in logFiles) {
            [[NSFileManager defaultManager] removeItemAtPath:logFileInfo.filePath error:nil];
    }
}
@end
