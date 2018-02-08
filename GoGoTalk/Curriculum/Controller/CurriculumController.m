//
//  CurriculumController.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/29.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "CurriculumController.h"
#import "CurriculumView.h"

#import "CurriculumTopView.h"
#import "CurriculumVIPCell.h"
#import "CurriculumVIPEndCell.h"

#import "ClassInfoController.h"
@interface CurriculumController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) CurriculumTopView *VIPTopView;
@property(nonatomic, assign) BOOL ca;  //判断未结课、已结课状态
@end

@implementation CurriculumController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课表";
    [self setTopBackgroundView];
    [self setContentView];
    [self setNavRightBtn];
    [self btnClick];
}
#pragma mark 各种按钮点击事件
-(void)btnClick{
    [[self.VIPTopView.endClassBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        self.ca = !self.ca;
        [UIView animateWithDuration:0.3 animations:^{
            self.VIPTopView.btnBottomView.centerX = self.VIPTopView.endClassBtn.centerX;
        }];
        [self.VIPTopView.endClassBtn setTitleColor:UICOLOR_FROM_HEX(0x333333) forState:UIControlStateNormal];
        [self.VIPTopView.noClassBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];

        [self.tableView reloadData];
    }];
    [[self.VIPTopView.noClassBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        self.ca = !self.ca;
        [UIView animateWithDuration:0.3 animations:^{
            self.VIPTopView.btnBottomView.centerX = self.VIPTopView.noClassBtn.centerX;
        }];
        [self.VIPTopView.noClassBtn setTitleColor:UICOLOR_FROM_HEX(0x333333) forState:UIControlStateNormal];
        [self.VIPTopView.endClassBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];

        [self.tableView reloadData];
    }];
   
}
#pragma mark 客服电话按钮
-(void)setNavRightBtn
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"kb_feixhengshi_kefu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(kefu:)];
}
#pragma mark 客服电话
-(void)kefu:(UIBarButtonItem *)sender{
    NSLog(@"拨打客服电话");
}
-(void)setTopBackgroundView
{
    self.bgView = [UIView new];
    self.bgView.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    //self.bgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(60);
    }];
}
-(void)setContentView{
    int userState = 2;
    if(userState == 1){
        
        //免费用户
        CurriculumView *contentView = [[CurriculumView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT())];
        contentView.stateCode = 5;
        [self.view addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(self.view.mas_top);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }else{
//        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
        [self.bgView removeFromSuperview];
        //顶部切换按钮
        self.VIPTopView = [CurriculumTopView new];
        [self.view addSubview:self.VIPTopView];
        [self.VIPTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top);
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.height.mas_equalTo(LineH(49));
        }];
        //VIP用户
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + LineH(59), SCREEN_WIDTH(), SCREEN_HEIGHT()) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.VIPTopView.mas_bottom).with.offset(LineH(10));
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(self.ca == 0){
        CurriculumVIPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VIPCell"];
        if(cell == nil){
            cell = [[CurriculumVIPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VIPCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.stateCode = indexPath.row;
        return cell;
    }else{
        CurriculumVIPEndCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VIPEndCell"];
        if(cell == nil){
            cell = [[CurriculumVIPEndCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VIPEndCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.stateCode = indexPath.row;
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LineH(134);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.ca == 1){
        ClassInfoController *vc = [ClassInfoController new];
        vc.cid = 1;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
