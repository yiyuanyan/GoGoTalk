//
//  CurriculumView.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/30.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "CurriculumView.h"
@interface CurriculumView()
@property(nonatomic, strong) UIImageView *bgImageView;
@property(nonatomic, strong) UIView *view;
/* --------已预约 -- 准备上课-------- */
@property(nonatomic, strong) UILabel *dataTitleLabe;  //时间
@property(nonatomic, strong) UILabel *nameLabel;  //老师姓名
@property(nonatomic, strong) UILabel *classNameLabel;  //课程名称
@property(nonatomic, strong) UILabel *experienceLabel; //体验课标记
/* --------已预约 -- 缺席-------- */
/* --------评级-------- */
@property(nonatomic, strong) UILabel *levelLabel;
@property(nonatomic, strong)NSArray *leveIconArray;
@property(nonatomic, strong)NSArray *leveIconArray2;
@property(nonatomic, strong) NSArray *leveTitleArray;
@property(nonatomic, strong) NSArray *levelNameArray;
@end
@implementation CurriculumView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.leveIconArray = [NSArray arrayWithObjects:@"kb-L1-yi",@"kb-L4-yi",@"kb-L7-yi",@"kb-L10-yi",@"kb-L13-yi",@"kb-L16-yi", nil];
        self.leveIconArray2 = [NSArray arrayWithObjects:@"kb-L1-yi",@"kb-L4-wei",@"kb-L7-wei",@"kb-L10-wei",@"kb-L13-wei",@"kb-L16-wei", nil];
        self.leveTitleArray = [NSArray arrayWithObjects:@"L1~L3",@"L4~L6",@"L7~L9",@"L10~L12",@"L13~L15",@"L16~L18", nil];
        self.levelNameArray = [NSArray arrayWithObjects:@"入门",@"基础",@"进阶",@"高阶",@"流利",@"精通", nil];
        self.view = [UIView new];
        self.view.backgroundColor = [UIColor clearColor];
        [self addSubview:self.view];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
        }];
        self.bgImageView = [UIImageView new];
        self.bgImageView.image = UIIMAGE_FROM_NAME(@"kb-tiyanke-daishang-bj");
        [self.view addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).with.offset(10);
            make.right.equalTo(self.view.mas_right).with.offset(-10);
            make.top.equalTo(self.view.mas_top);
        }];
        [self.bgImageView layoutIfNeeded];
    }
    return self;
}
-(void)setStateCode:(int)stateCode
{
    if(stateCode == 1){
        //未预约状态
        [self noAppointmentView];
    }else if(stateCode == 2){
        //已预约 -- 准备上课
        [self baseBackgroundView];
        [self haveAppointment];
        [self baseBottomView];
    }else if(stateCode == 3){
        //已预约  -- 未出席上课
        [self baseBackgroundView];
        [self absentAppointment];
        [self baseBottomView];
    }else if(stateCode == 4){
        //等待评测
        [self waitEvaluation];
        
    }else if(stateCode == 5){
        //评测信息
        [self evaluation];
    }
}
#pragma mark 未预约状态
-(void)noAppointmentView{
    [self.bgImageView removeFromSuperview];
    self.bgImageView = [UIImageView new];
    self.bgImageView.image = UIIMAGE_FROM_NAME(@"kb_feixhengshi_beijing");
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.mas_equalTo(LineH(487));
    }];
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = Font(20);
    titleLabel.text = @"青少英语在线外教 1 对 1 体验课";
    titleLabel.textColor = UICOLOR_FROM_HEX(0x000000);
    [self.bgImageView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.bgImageView.mas_top).with.offset(LineH(150));
    }];
    UILabel *subLabel = [UILabel new];
    subLabel.font = Font(20);
    subLabel.textColor = UICOLOR_FROM_HEX(0x000000);
    subLabel.text = @"及专业英语评测报告";
    [self.bgImageView addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(titleLabel.mas_bottom).with.offset(15);
    }];
    UIImageView *hourglassImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb_feixhengshi_dengdaizhong"]];
    [self.bgImageView addSubview:hourglassImage];
    [hourglassImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.bgImageView.mas_top).with.offset(LineH(285));
        //make.bottom.equalTo(self.bgImageView.mas_bottom).with.offset(-150);
        make.width.mas_equalTo(LineW(35));
        make.height.mas_equalTo(LineH(42));
    }];
    UILabel *promptLabel = [UILabel new];
    promptLabel.font = Font(14);
    promptLabel.text = @"课程顾问会及时联系您安排体验课";
    promptLabel.textColor = UICOLOR_FROM_HEX(0x4d4d4d);
    [self.bgImageView addSubview:promptLabel];
    [promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(hourglassImage.mas_bottom).with.offset(LineH(19));
    }];
    UIView *prompt2View = [UIView new];
    //prompt2View.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self.bgImageView addSubview:prompt2View];
    [prompt2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.height.mas_equalTo(LineH(15));
        make.width.mas_equalTo(LineW(272));
        make.top.equalTo(promptLabel.mas_bottom).with.offset(LineH(14));
    }];
    UIImageView *wenhao = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb_feixhengshi_yiwen"]];
    [prompt2View addSubview:wenhao];
    [wenhao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineW(14));
        make.left.equalTo(prompt2View.mas_left);
        make.top.equalTo(prompt2View.mas_top);
    }];
    
    UILabel *prompt2Label = [UILabel new];
    prompt2Label.font = Font(12);
    prompt2Label.textColor = UICOLOR_FROM_HEX(0x999999);
    prompt2Label.text = @"如有疑问， 请拨打客服电话： 400-8787-276";
    [prompt2View addSubview:prompt2Label];
    [prompt2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wenhao.mas_right).with.offset(LineW(12));
        make.top.equalTo(prompt2View.mas_top);
    }];
    
    UIView *btnView = [UIView new];
    btnView.backgroundColor = [UIColor clearColor];
    [self.bgImageView addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.width.mas_equalTo(LineW(238));
        make.height.mas_equalTo(LineH(35));
        make.top.equalTo(prompt2Label.mas_bottom).with.offset(LineH(24));
    }];
    
    
    
    self.kcBtn = [UIButton new];
    [self.kcBtn setTitle:@"课程体系" forState:UIControlStateNormal];
    self.kcBtn.titleLabel.font = Font(14);
    [self.kcBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.kcBtn.layer.masksToBounds = YES;
    self.kcBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
    self.kcBtn.layer.borderWidth = 1;
    self.kcBtn.layer.cornerRadius = LineH(34)/2;
    [btnView addSubview:self.kcBtn];
    [self.kcBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnView.mas_left);
        make.top.equalTo(btnView.mas_top);
        make.width.mas_equalTo(LineW(89));
        make.height.mas_equalTo(LineH(34));
    }];
    
    self.szBtn = [UIButton new];
    [self.szBtn setTitle:@"师资服务" forState:UIControlStateNormal];
    self.szBtn.titleLabel.font = Font(14);
    [self.szBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.szBtn.layer.masksToBounds = YES;
    self.szBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
    self.szBtn.layer.borderWidth = 1;
    self.szBtn.layer.cornerRadius = LineH(34)/2;
    [btnView addSubview:self.szBtn];
    [self.szBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.kcBtn.mas_right).with.offset(LineX(59));
        make.top.equalTo(self.kcBtn.mas_top);
        make.width.mas_equalTo(LineW(89));
        make.height.mas_equalTo(LineH(34));
    }];
}
#pragma mark 基本视图
-(void)baseBackgroundView{
    
    UIImageView *sanjiao = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb-tiyankedaishang-bj"]];
    [self.bgImageView addSubview:sanjiao];
    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView.mas_top);
        make.left.equalTo(self.bgImageView.mas_left);
        make.right.equalTo(self.bgImageView.mas_right);
    }];
    self.dataTitleLabe = [UILabel new];
    self.dataTitleLabe.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    self.dataTitleLabe.textColor = [UIColor whiteColor];
    self.dataTitleLabe.text = @"04月17日（周三） 13:00开课";
    [sanjiao addSubview:self.dataTitleLabe];
    [self.dataTitleLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sanjiao.mas_top).with.offset(LineH(24));
        make.centerX.equalTo(sanjiao.mas_centerX);
    }];
    UIImageView *teacherPhoto = [[UIImageView alloc] init];
    teacherPhoto.backgroundColor = [UIColor whiteColor];
    teacherPhoto.layer.masksToBounds = YES;
    teacherPhoto.layer.cornerRadius = LineH(75)/2;
    teacherPhoto.layer.borderColor = UICOLOR_FROM_HEX(0xffba00).CGColor;
    teacherPhoto.layer.borderWidth = 2;
    [self.bgImageView addSubview:teacherPhoto];
    [teacherPhoto mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.dataTitleLabe.mas_bottom).with.offset(LineH(12));
        make.width.height.mas_equalTo(LineH(75));
    }];
    self.nameLabel = [UILabel new];
    self.nameLabel.font = Font(16);
    self.nameLabel.text = @"Ruisun";
    self.nameLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    [self.bgImageView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(teacherPhoto.mas_bottom).with.offset(LineH(10));
    }];
    self.classNameLabel = [UILabel new];
    self.classNameLabel.font = Font(16);
    self.classNameLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    self.classNameLabel.text = @"Lesson1-1";
    [self.classNameLabel sizeToFit];
    self.experienceLabel = [UILabel new];
    self.experienceLabel.font = Font(15);
    self.experienceLabel.textColor = UICOLOR_FROM_HEX(0xFFBA00);
    self.experienceLabel.text = @"[ 体验课 ]";
    [self.experienceLabel sizeToFit];
    [self.bgImageView addSubview:self.classNameLabel];
    CGFloat a = (self.bgImageView.frame.size.width/2) - ((self.classNameLabel.frame.size.width + self.experienceLabel.frame.size.width + LineW(10))/2);
    [self.classNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView.mas_left).with.offset(a);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(LineH(11));
    }];
    [self.bgImageView addSubview:self.experienceLabel];
    [self.experienceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.classNameLabel.mas_centerY);
        make.left.equalTo(self.classNameLabel.mas_right).with.offset(LineX(10));
        
    }];
}
-(void)baseBottomView{
    //底部提示信息
    UIImageView *icon1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb-icon-diannao"]];
    [self.bgImageView addSubview:icon1];
    [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView.mas_left).with.offset(LineX(29));
        make.height.width.mas_equalTo(LineH(14));
        make.top.equalTo(self.bgImageView.mas_top).with.offset(LineH(430));
    }];
    UILabel *promptLabel1 = [UILabel new];
    promptLabel1.font = Font(13);
    promptLabel1.textColor = UICOLOR_FROM_HEX(0x666666);
    promptLabel1.text = @"电脑上课，请登录官网 “www.gogo-talk.com”";
    [self.bgImageView addSubview:promptLabel1];
    [promptLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(icon1.mas_right).with.offset(LineX(10));
        make.centerY.equalTo(icon1.mas_centerY);
    }];
    UIImageView *icon2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb-icon-iPad"]];
    [self.bgImageView addSubview:icon2];
    [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(13));
        make.height.mas_equalTo(LineH(15.5));
        make.centerX.equalTo(icon1.mas_centerX);
        make.top.equalTo(icon1.mas_bottom).with.offset(LineH(11));
    }];
    UILabel *promptLabel2 = [UILabel new];
    promptLabel2.font = Font(13);
    promptLabel2.textColor = UICOLOR_FROM_HEX(0x666666);
    promptLabel2.text = @"iPad 上课，请在App Store下载 “GoGo英语HD”";
    [self.bgImageView addSubview:promptLabel2];
    [promptLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(icon2.mas_centerY);
        make.left.equalTo(promptLabel1.mas_left);
    }];
}
#pragma mark 已预约状态 -- 准备上课
-(void)haveAppointment{
    
    //进入教室按钮
    self.enterClassRoomBtn = [[UIButton alloc] init];
    [self.enterClassRoomBtn setTitle:@"进入教室" forState:UIControlStateNormal];
    //[self.enterClassRoomBtn setTintColor:UICOLOR_FROM_HEX(0xea5851)];
    self.enterClassRoomBtn.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    self.enterClassRoomBtn.layer.masksToBounds = YES;
    self.enterClassRoomBtn.layer.cornerRadius = LineH(39)/2;
    self.enterClassRoomBtn.titleLabel.font = Font(12);
    [self.enterClassRoomBtn setTitleColor:UICOLOR_FROM_HEX(0xffffff) forState:UIControlStateNormal];
    [self.bgImageView addSubview:self.enterClassRoomBtn];
    [self.enterClassRoomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.classNameLabel.mas_bottom).with.offset(LineH(21));
        make.width.mas_equalTo(LineW(180));
        make.height.mas_equalTo(LineH(39));
    }];
    //课前预习
    self.previewBtn = [UIButton new];
    [self.previewBtn setTitle:@"课前预习" forState:UIControlStateNormal];
    self.previewBtn.titleLabel.font = Font(17);
    [self.previewBtn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
    self.previewBtn.layer.borderColor = UICOLOR_FROM_HEX(0xea5851).CGColor;
    self.previewBtn.layer.borderWidth = 1;
    self.previewBtn.layer.masksToBounds = YES;
    self.previewBtn.layer.cornerRadius = LineH(39)/2;
    [self.bgImageView addSubview:self.previewBtn];
    [self.previewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.enterClassRoomBtn.mas_bottom).with.offset(LineH(20));
        make.width.mas_equalTo(LineW(180));
        make.height.mas_equalTo(LineH(39));
    }];
    //上课须知
    self.noticeBtn = [UIButton new];
    [self.noticeBtn setTitle:@"上课须知" forState:UIControlStateNormal];
    self.noticeBtn.titleLabel.font = Font(17);
    [self.noticeBtn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
    self.noticeBtn.layer.borderColor = UICOLOR_FROM_HEX(0xea5851).CGColor;
    self.noticeBtn.layer.borderWidth = 1;
    self.noticeBtn.layer.masksToBounds = YES;
    self.noticeBtn.layer.cornerRadius = LineH(39)/2;
    [self.bgImageView addSubview:self.noticeBtn];
    [self.noticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.previewBtn.mas_bottom).with.offset(LineH(20));
        make.width.mas_equalTo(LineW(180));
        make.height.mas_equalTo(LineH(39));
    }];
    
}
#pragma mark  已预约状态 -- 缺席
-(void)absentAppointment{
    UILabel *mesLabel1 = [UILabel new];
    mesLabel1.font = Font(14);
    mesLabel1.text = @"你没有出席本次体验课，如果需要重新预约";
    mesLabel1.textColor = UICOLOR_FROM_HEX(0x666666);
    [self.bgImageView addSubview:mesLabel1];
    [mesLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.classNameLabel.mas_bottom).with.offset(LineH(21));
    }];
    UILabel *mesLabel2 = [UILabel new];
    mesLabel2.font = Font(14);
    mesLabel2.text = @"请联系我们!";
    mesLabel2.textColor = UICOLOR_FROM_HEX(0x666666);
    [self.bgImageView addSubview:mesLabel2];
    [mesLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(mesLabel1.mas_bottom).with.offset(LineH(10));
    }];
    //客服电话
    UILabel *kefuTel = [UILabel new];
    kefuTel.font = Font(14);
    kefuTel.textColor = UICOLOR_FROM_HEX(0xea5851);
    kefuTel.text = @"客服电话：400-8787-276";
    [self.bgImageView addSubview:kefuTel];
    [kefuTel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(mesLabel2.mas_bottom).with.offset(LineH(35));
    }];
    self.kefuBtn = [[UIButton alloc] init];
    [self.kefuBtn setTitle:@"拨打电话" forState:UIControlStateNormal];
    [self.kefuBtn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
    self.kefuBtn.layer.masksToBounds = YES;
    self.kefuBtn.layer.cornerRadius = LineH(39)/2;
    self.kefuBtn.layer.borderColor = UICOLOR_FROM_HEX(0xea5851).CGColor;
    self.kefuBtn.layer.borderWidth = 1;
    [self.bgImageView addSubview:self.kefuBtn];
    [self.kefuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(kefuTel.mas_bottom).with.offset(LineH(15));
        make.width.mas_equalTo(LineW(180));
        make.height.mas_equalTo(LineH(39));
    }];
}
#pragma mark 等待评测
-(void)waitEvaluation{
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb-icon-dengdaizhong"]];
    [self.bgImageView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(self.bgImageView.mas_top).with.offset(LineH(95));
        make.width.mas_equalTo(LineW(106));
        make.height.mas_equalTo(LineH(127));
    }];
    UILabel *mesLabel1 = [UILabel new];
    mesLabel1.font = Font(18);
    mesLabel1.text = @"外教老师正在完成测试报告";
    mesLabel1.textColor = UICOLOR_FROM_HEX(0x666666);
    [self.bgImageView addSubview:mesLabel1];
    [mesLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(icon.mas_bottom).with.offset(LineH(30));
    }];
    UILabel *mesLabel2 = [UILabel new];
    mesLabel2.font = Font(18);
    mesLabel2.textColor = UICOLOR_FROM_HEX(0x666666);
    mesLabel2.text = @"请等待...";
    [self.bgImageView addSubview:mesLabel2];
    [mesLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.equalTo(mesLabel1.mas_bottom).with.offset(LineH(10));
    }];
    self.kcBtn = [UIButton new];
    [self.kcBtn setTitle:@"课程体系" forState:UIControlStateNormal];
    self.kcBtn.titleLabel.font = Font(14);
    [self.kcBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.kcBtn.layer.masksToBounds = YES;
    self.kcBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
    self.kcBtn.layer.borderWidth = 1;
    self.kcBtn.layer.cornerRadius = LineH(34)/2;
    [self.bgImageView addSubview:self.kcBtn];
    [self.kcBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImageView.mas_bottom).with.offset(-LineH(30));
        make.left.equalTo(self.bgImageView.mas_left).with.offset(LineX(60));
        make.width.mas_equalTo(LineW(89));
        make.height.mas_equalTo(LineH(34));
    }];
    self.szBtn = [UIButton new];
    [self.szBtn setTitle:@"师资服务" forState:UIControlStateNormal];
    self.szBtn.titleLabel.font = Font(14);
    [self.szBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.szBtn.layer.masksToBounds = YES;
    self.szBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
    self.szBtn.layer.borderWidth = 1;
    self.szBtn.layer.cornerRadius = LineH(34)/2;
    [self.bgImageView addSubview:self.szBtn];
    [self.szBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.kcBtn.mas_right).with.offset(LineX(60));
        make.width.mas_equalTo(LineW(89));
        make.height.mas_equalTo(LineH(34));
        make.centerY.equalTo(self.kcBtn.mas_centerY);
    }];
}
#pragma mark 评测信息
-(void)evaluation{
    UIView *topView = [UIView new];
    [self.bgImageView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(162));
        make.height.mas_equalTo(LineH(20));
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.top.mas_equalTo(LineH(24));
    }];
    UILabel *topLabel = [UILabel new];
    topLabel.font = Font(14);
    topLabel.textColor = UICOLOR_FROM_HEX(0x666666);
    topLabel.text = @"您当前英语水平";
    [topView addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left);
        make.centerY.equalTo(topView.mas_centerY);
    }];
    self.levelLabel = [UILabel new];
    self.levelLabel.font = Font(18);
    self.levelLabel.text = @"Level 1";
    self.levelLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    [topView addSubview:self.levelLabel];
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topLabel.mas_right).with.offset(LineW(10));
        make.centerY.equalTo(topLabel.mas_centerY);
    }];
    //levelView
    UIView *levelView = [UIView new];

    [self.bgImageView addSubview:levelView];
    [levelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topLabel.mas_bottom).with.offset(LineH(40));
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.width.mas_equalTo(LineW(286));
        make.height.mas_equalTo(LineH(225));
    }];
    NSMutableArray *mArray = [NSMutableArray array];
    for(int i=0;i<self.leveIconArray2.count;i++){
        UILabel *label = [UILabel new];
        label.font = Font(10);
        label.textColor = UICOLOR_FROM_HEX(0x999999);
        label.text = self.leveTitleArray[i];
        [levelView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(levelView.mas_left).with.offset(i*(LineW(50)));
            make.height.mas_equalTo(LineH(10));
            make.bottom.equalTo(levelView.mas_bottom).with.offset(-LineH(21));
        }];
        UILabel *nameLabel = [UILabel new];
        nameLabel.font = Font(11);
        nameLabel.textColor = UICOLOR_FROM_HEX(0x999999);
        nameLabel.text = self.levelNameArray[i];
        [levelView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(label.mas_centerX);
            make.bottom.equalTo(levelView.mas_bottom);
        }];
        UIImageView *levelIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.leveIconArray2[i]]];
        [levelView addSubview:levelIcon];
        [levelIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(label.mas_centerX);
            make.bottom.equalTo(label.mas_top).with.offset(-LineH(11));
            make.width.mas_equalTo(LineW(15));
        }];
        [mArray addObject:levelIcon];
    }
    //级别标识
    UIImageView *LImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kb-cpbg-dangqianjibie"]];
    [levelView addSubview:LImage];
    UIImageView *mImage = mArray[0];
    [LImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(mImage.mas_centerX);
        make.height.mas_equalTo(LineH(28));
        make.width.mas_equalTo(LineW(23));
        make.bottom.equalTo(mImage.mas_top).with.offset(-LineH(11));
    }];
    UILabel *LLabel = [UILabel new];
    LLabel.font = Font(11);
    LLabel.text = @"L1";
    LLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    [LImage addSubview:LLabel];
    [LLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(LImage.mas_centerX);
        make.centerY.equalTo(LImage.mas_centerY).with.offset(-LineH(3));
    }];
    self.reportBtn = [UIButton new];
    self.reportBtn.titleLabel.font = Font(17);
    [self.reportBtn setTitle:@"查看评测报告" forState:UIControlStateNormal];
    [self.reportBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.reportBtn.backgroundColor = UICOLOR_FROM_HEX(0xEA5851);
    self.reportBtn.layer.masksToBounds = YES;
    self.reportBtn.layer.cornerRadius = LineH(39)/2;
    [self.bgImageView addSubview:self.reportBtn];
    [self.reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.width.mas_equalTo(LineW(180));
        make.height.mas_equalTo(LineH(39));
        make.top.equalTo(levelView.mas_bottom).with.offset(LineY(20));
    }];
    
    
    
    self.kcBtn = [UIButton new];
    [self.kcBtn setTitle:@"课程体系" forState:UIControlStateNormal];
    self.kcBtn.titleLabel.font = Font(14);
    [self.kcBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.kcBtn.layer.masksToBounds = YES;
    self.kcBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
    self.kcBtn.layer.borderWidth = 1;
    self.kcBtn.layer.cornerRadius = LineH(34)/2;
    [self.bgImageView addSubview:self.kcBtn];
    [self.kcBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImageView.mas_bottom).with.offset(-LineH(30));
        make.left.equalTo(self.bgImageView.mas_left).with.offset(LineX(60));
        make.width.mas_equalTo(LineW(89));
        make.height.mas_equalTo(LineH(34));
    }];
    self.szBtn = [UIButton new];
    [self.szBtn setTitle:@"师资服务" forState:UIControlStateNormal];
    self.szBtn.titleLabel.font = Font(14);
    [self.szBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.szBtn.layer.masksToBounds = YES;
    self.szBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
    self.szBtn.layer.borderWidth = 1;
    self.szBtn.layer.cornerRadius = LineH(34)/2;
    [self.bgImageView addSubview:self.szBtn];
    [self.szBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.kcBtn.mas_right).with.offset(LineX(60));
        make.width.mas_equalTo(LineW(89));
        make.height.mas_equalTo(LineH(34));
        make.centerY.equalTo(self.kcBtn.mas_centerY);
    }];
}
@end
