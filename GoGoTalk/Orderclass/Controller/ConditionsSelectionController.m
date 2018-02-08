//
//  ConditionsSelectionController.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/7.
//  Copyright © 2018年 何建新. All rights reserved.
//  条件选择

#import "ConditionsSelectionController.h"

@interface ConditionsSelectionController ()
@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UIButton *sexButton0;  //不限
@property(nonatomic, strong) UIButton *sexButton1;  //男
@property(nonatomic, strong) UIButton *sexButton2;  //女
@end

@implementation ConditionsSelectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择时间";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavItems];
    [self builTeacherView];
    // Do any additional setup after loading the view.
}

#pragma mark 客服电话按钮
-(void)setNavItems
{
    
    //左侧返回按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon-guanbi"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(goToBack:)];
}
#pragma mark 自定义返回按钮
-(void)goToBack:(UIBarButtonItem *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark  外教性别
-(void)builTeacherView{
    UIImageView *teachIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-xingbie"]];
    [self.view addSubview:teachIcon];
    [teachIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(LineX(10));
        make.top.equalTo(self.view.mas_top).with.offset(LineH(15));
        make.width.mas_equalTo(LineW(13));
        make.height.mas_equalTo(LineH(14));
    }];
    UILabel *sexLabel = [UILabel new];
    sexLabel.font = Font(14);
    sexLabel.text = @"外教性别";
    sexLabel.textColor = UICOLOR_FROM_HEX(0x666666);
    [self.view addSubview:sexLabel];
    [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teachIcon.mas_centerY);
        make.left.equalTo(teachIcon.mas_right).with.offset(LineX(5));
    }];
    self.sexButton0 = [UIButton new];
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
