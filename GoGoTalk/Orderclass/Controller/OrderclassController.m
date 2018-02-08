//
//  OrderclassController.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/29.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "OrderclassController.h"
#import "SearchView.h"
#import "TeacherCell.h"
#import "ConditionsSelectionController.h"
#import "BaseNavigationController.h"

@interface OrderclassController ()<UITableViewDelegate,UITableViewDataSource,TeacherCellButtonDelegate>
@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UIView *navTitleBottomView;
@property(nonatomic, strong) SearchView *sv;  //搜索框View
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIButton *allBtn;  //所有外教
@property(nonatomic, strong) UIButton *followBtn;  //关注的外教
@property(nonatomic, strong) UIView *titleView;
@end

@implementation OrderclassController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitleView];
    [self searchView];
    [self builTableView];
}

#pragma mark -- 设置导航栏按钮
-(void)setNavTitleView{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    CGFloat a = SCREEN_WIDTH()/2 - 80;
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(a, 0, 165, 44)];
    self.navigationItem.titleView = self.titleView;
    self.allBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 16, 70, 18)];
    [self.allBtn setTitle:@"全部外教" forState:UIControlStateNormal];
    [self.allBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.allBtn.titleLabel.font = Font(16);
    [self.allBtn addTarget:self action:@selector(allBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.allBtn];
    
    self.followBtn = [[UIButton alloc] initWithFrame:CGRectMake(95, 16, 70, 18)];
    [self.followBtn setTitle:@"我的关注" forState:UIControlStateNormal];
    [self.followBtn setTitleColor:UICOLOR_FROM_HEX(0xffcac7) forState:UIControlStateNormal];
    self.followBtn.titleLabel.font = Font(16);
    [self.followBtn addTarget:self action:@selector(followBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.followBtn];
    self.navTitleBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 41, 70, 3)];
    self.navTitleBottomView.backgroundColor = [UIColor whiteColor];
    [self.titleView addSubview:self.navTitleBottomView];
    
}

#pragma mark -- 点击导航栏全部外教按钮事件
-(void)allBtnClick:(UIButton *)sender
{
    [sender setTitleColor:UICOLOR_FROM_HEX(0xffffff) forState:UIControlStateNormal];
    [self.followBtn setTitleColor:UICOLOR_FROM_HEX(0xffcac7) forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.navTitleBottomView.centerX = self.allBtn.centerX;
    }];

    
    
    self.sv.hidden = NO;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(LineH(49));
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    [self.tableView reloadData];
}
#pragma mark -- 点击导航栏“我的关注”按钮事件
-(void)followBtnClick:(UIButton *)sender
{
    [sender setTitleColor:UICOLOR_FROM_HEX(0xffffff) forState:UIControlStateNormal];
    [self.allBtn setTitleColor:UICOLOR_FROM_HEX(0xffcac7) forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.navTitleBottomView.centerX = self.followBtn.centerX;
    }];
    
 
    
    self.sv.hidden = YES;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    [self.tableView reloadData];
    
}
#pragma mark -- 搜索框
-(void)searchView
{
    self.sv = [SearchView new];
    [self.view addSubview:self.sv];
    [self.sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(LineH(29));
        make.top.equalTo(self.view.mas_top).with.offset(0);
    }];
    [[self.sv.con rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了搜索框");
        ConditionsSelectionController *cc = [ConditionsSelectionController new];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:cc];
        [self presentViewController:nav animated:YES completion:nil];
        
    }];
}

#pragma mark -- tableView
-(void)builTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, LineH(49), SCREEN_WIDTH(), SCREEN_HEIGHT()-64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(LineH(49));
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LineH(84);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tCell"];
    if(cell == nil){
        cell = [[TeacherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tCell"];
    }
    cell.selectionStyle = UIAccessibilityTraitNone;
    cell.delegate = self;
    cell.stateCode = indexPath.row;
    return cell;
}
-(void)didClickCellButton:(UIButton *)button{
    NSLog(@"%@",button.titleLabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
