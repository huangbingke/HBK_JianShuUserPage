//
//  ViewController.m
//  HBK_JianShuUserPage
//
//  Created by 黄冰珂 on 2017/11/14.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#import "ViewController.h"
#import "HBK_UserPageViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//个人主页
- (IBAction)nextUserPage:(UIButton *)sender {
    HBK_UserPageViewController *userVC = [[HBK_UserPageViewController alloc] init];
    
    [self.navigationController pushViewController:userVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
