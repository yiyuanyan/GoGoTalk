//
//  ClassInfoController.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/5.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "ClassInfoController.h"
#import "ClassInfoCell.h"
#import "ClassEvaluateController.h"
@interface ClassInfoController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *bgView;
@end

@implementation ClassInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程详情";
    // Do any additional setup after loading the view.
    [self setNavItems];
    [self setTopBackgroundView];
    [self builTableView];
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

#pragma mark - tableView
-(void)builTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH(), SCREEN_HEIGHT()-64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 48;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.right.left.bottom.equalTo(self.view);
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if(cell == nil){
        cell = [[ClassInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
    }
//    if(indexPath.row == 1 || indexPath.row == 2){
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    cell.row = indexPath.row;
    [[cell.waitEvealuationBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.navigationController pushViewController:[ClassEvaluateController new] animated:YES];
    }];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return LineH(130);
    }
    
    return UITableViewAutomaticDimension;
}

@end
