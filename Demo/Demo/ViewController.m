//
//  ViewController.m
//  Demo
//
//  Created by 小细菌 on 2020/12/8.
//

#import "ViewController.h"
#import <ELLogger/ELLogger.h>
 

@interface ViewController ()
{
    NSTimer* myTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    GXLog(@"%@",[ELLogger getLogPath]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
//    GXLog(@"hello");
//    for(int i = 0 ; i<=1000 ; i++)
        
    GXLog(@"dslfjlfj12312313123");
    [self.navigationController pushViewController:[ELLogger getLoggerViewController] animated:YES];
    
    
 
    
}
- (IBAction)upload:(id)sender {
    
    
    
}


@end
