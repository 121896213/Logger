//
//  LoggerDetailViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/1/27.
//  Copyright © 2016年 wujunyang. All rights reserved.
//



#import "LoggerDetailViewController.h"


static NSString* const kMail_cc_ToRecipients_Address=@"121896213@qq.com";



@interface LoggerDetailViewController ()<MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) NSString *logText;
@property (nonatomic, strong) NSString *logDate;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation LoggerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.textView.editable = NO;
    self.textView.text = self.logText;
    [self.view addSubview:self.textView];
    
    //设置右边
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,30)];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [rightButton setTitle:@"邮件" forState:UIControlStateNormal];
    [rightButton setTitle:@"底部" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(sendMailMessage)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (id)initWithLog:(NSString *)logText forDateString:(NSString *)logDate
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _logText = logText;
        _logDate = logDate;
        self.title = logDate;
    }
    return self;
}

#pragma mark MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved...");
            
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent...");
//            [MBProgressHUD showSuccess:@"发送邮件成功" ToView:self.view];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
//            [MBProgressHUD showError:@"发送邮件失败" ToView:self.view];
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 自定义代码

-(void)sendMailMessage
{
    
}



@end
