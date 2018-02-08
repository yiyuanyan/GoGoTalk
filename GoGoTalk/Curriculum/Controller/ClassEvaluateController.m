//
//  ClassEvaluateController.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/5.
//  Copyright © 2018年 何建新. All rights reserved.
//  课后评价

#import "ClassEvaluateController.h"
#import "ClassEvaluateView.h"
@interface ClassEvaluateController ()<UITextViewDelegate>
@property(nonatomic, strong) UIView *bgView;
@end

@implementation ClassEvaluateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课后评价";
    [self setTopBackgroundView];
    [self setNavItems];
    [self setContentView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 客服电话按钮
-(void)setNavItems
{
    //左侧返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon-fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(goToBack:)];
    //右侧客服按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"kb_feixhengshi_kefu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(kefu:)];
}
#pragma mark 客服电话
-(void)kefu:(UIBarButtonItem *)sender{
    NSLog(@"拨打客服电话");
}
#pragma mark 自定义返回按钮
-(void)goToBack:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setTopBackgroundView
{
    self.bgView = [UIView new];
    self.bgView.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(64);
    }];
}
-(void)setContentView{
    ClassEvaluateView *view = [ClassEvaluateView new];
    view.remarkTextView.delegate = self;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
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
