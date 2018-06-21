//
//  ViewController.m
//  animationNavigationBarApp
//
//  Created by apple on 2018/06/21.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *now = [NSDate date];
    NSLog(@"now %@",now);
    // NSCalendar を取得します。
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    
    
    // 取得したい要素（今回は年と月）を表すフラグを添えて、日付からその情報を持った NSDateComponents を取得します。
    
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSHourCalendarUnit fromDate:now];
    
    
    
    // これで、NSDateComponents から、年や月を取得することが可能です。
    
    NSInteger hours = components.hour+18;
    NSLog(@"hours %ld",hours);
//    NSInteger month = components.month;
    UIImage *img;
    if (hours <17 && hours>10) {
        img = [UIImage imageNamed:@"bg_w1500_aozora.png"];
    }else if (hours >17 && hours <22){
        NSArray *images = @[[UIImage imageNamed:@"bg_w1500_aozora.png"],
                            [UIImage imageNamed:@"bg_w1500_yuyake.png"],
                            [UIImage imageNamed:@"bg_w1500_aozora.png"]];
        img = [UIImage animatedImageWithImages:images duration:1.0f];
        
//        img = [UIImage imageNamed:@"bg_w1500_yuyake.png"];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)touchNextView:(id)sender {
    NextViewController *controller = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
