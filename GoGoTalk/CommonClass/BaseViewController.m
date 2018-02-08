//
//  BaseViewController.m
//  FF14Raiders
//
//  Created by 何建新 on 2017/10/26.
//  Copyright © 2017年 何建新. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property(nonatomic, strong) UIView *bgView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self setNavStyle];
    //[self setTopBackgroundView];
}
//-(void)setTopBackgroundView
//{
//    self.bgView = [UIView new];
//    self.bgView.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
//    [self.view addSubview:self.bgView];
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top);
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.height.mas_equalTo(64);
//    }];
//}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
    //return UIStatusBarStyleDefault;
}
-(void)setNavStyle{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:UICOLOR_FROM_HEX(0xffffff)}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    //设置导航栏背景色
//    self.navigationController.navigationBar.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon-fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(goToBack)];
    //设置状态栏背景色
//    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    statusBar.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
}
-(void)goToBack{
    self.navigationController.navigationBar.hidden = YES;
    //返回上一级会显示状态栏高，这里将本级的状态栏也设置为透明。
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    statusBar.backgroundColor = [UIColor clearColor];
    [self.navigationController popViewControllerAnimated: YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
