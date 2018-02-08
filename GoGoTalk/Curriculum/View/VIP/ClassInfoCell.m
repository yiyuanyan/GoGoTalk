//
//  ClassInfoCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/5.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "ClassInfoCell.h"
@interface ClassInfoCell()
@property(nonatomic, assign) NSInteger row2;

@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *classNameLabel;
@property(nonatomic, strong) UILabel *teacherNameLabel;
@property(nonatomic, strong) UILabel *classStateLabel;
@property(nonatomic, strong) UIImageView *teacherPhoto;
@end

@implementation ClassInfoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.LineView = [UIView new];
        self.LineView.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
        [self.contentView addSubview:self.LineView];
        [self.LineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(LineH(1));
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
    }
    return self;
}
-(void)setRow:(NSInteger)row
{
    self.row2 = row;
    if(row == 0){
        [self builCellStyle1];
    }
    if(row == 1 || row == 2){
        [self builCellStyle2];
    }
    if(row == 3){
        [self builCellStyle3];
    }
    if(row == 4){
        [self builCellStyle4];
    }
    if(row == 5){
        [self builCellStyle5];
    }
}
-(void)builCellStyle1{
    
    self.timeLabel = [UILabel new];
    self.timeLabel.font = Font(15);
    self.timeLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    self.timeLabel.text = @"今日（周一）13:00";
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.top.equalTo(self.contentView.mas_top).with.offset(LineH(15));
    }];
    self.teacherPhoto = [UIImageView new];
    self.teacherPhoto.backgroundColor = [UIColor whiteColor];
    self.teacherPhoto.layer.masksToBounds = YES;
    self.teacherPhoto.layer.cornerRadius = LineH(60)/2;
    self.teacherPhoto.layer.borderColor = UICOLOR_FROM_HEX(0xF2F2F2).CGColor;
    self.teacherPhoto.layer.borderWidth = 1.0;
    [self.contentView addSubview:self.teacherPhoto];
    [self.teacherPhoto mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_left);
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(LineH(10));
        make.width.height.mas_equalTo(LineH(60));
    }];
    self.classNameLabel = [UILabel new];
    self.classNameLabel.font = Font(16);
    self.classNameLabel.textColor = UICOLOR_FROM_HEX(0x666666);
    self.classNameLabel.text = @"Get6 Ready";
    [self.contentView addSubview:self.classNameLabel];
    [self.classNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherPhoto.mas_right).with.offset(LineH(5));
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(LineH(22));
        //make.right.equalTo(self.contentView.mas_right).with.offset(-80);
    }];
    self.teacherNameLabel = [UILabel new];
    self.teacherNameLabel.font = Font(15);
    self.teacherNameLabel.textColor = UICOLOR_FROM_HEX(0x999999);
    self.teacherNameLabel.text = @"ruisun";
    [self.contentView addSubview:self.teacherNameLabel];
    [self.teacherNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.classNameLabel.mas_left);
        make.top.equalTo(self.classNameLabel.mas_bottom).with.offset(LineH(10));
    }];
    self.waitEvealuationBtn = [UIButton new];
    [self.waitEvealuationBtn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
    [self.waitEvealuationBtn setTitle:@"待评价" forState:UIControlStateNormal];
    self.waitEvealuationBtn.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
    self.waitEvealuationBtn.titleLabel.font = Font(13);
    self.waitEvealuationBtn.layer.masksToBounds = YES;
    self.waitEvealuationBtn.layer.cornerRadius = LineH(32)/2;
    self.waitEvealuationBtn.layer.borderColor = UICOLOR_FROM_HEX(0xea5851).CGColor;
    self.waitEvealuationBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.waitEvealuationBtn];
    [self.waitEvealuationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(86));
        make.height.mas_equalTo(LineH(32));
        make.right.mas_equalTo(-LineW(10));
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-LineH(20));
    }];
    UILabel *tishiLabel = [UILabel new];
    tishiLabel.font = Font(12);
    tishiLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    tishiLabel.text = @"迟到";
    
    [tishiLabel sizeToFit];
    [self.contentView addSubview:tishiLabel];
    [tishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
    }];
}
-(void)builCellStyle2
{
    UIImageView *rightsanjiao = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-liebiaojinru"]];
    [self.contentView addSubview:rightsanjiao];
    [rightsanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(7));
        make.height.mas_equalTo(LineH(14));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineW(20));
    }];
    UIImageView *icon = [UIImageView new];
    NSString *iconName = @"";
    NSString *titleName = @"";
    if(self.row2 == 1){
        iconName = @"icon-huifang-da";
        
        titleName = @"回放视频";
    }else if(self.row2 == 2){
        iconName = @"icon-fuxikejian";
        titleName = @"复习课件";
    }
    icon.image = [UIImage imageNamed:iconName];
    [self.contentView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(LineW(10));
    }];
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = Font(16);
    titleLabel.text = titleName;
    titleLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(icon.mas_right).with.offset(LineW(10));
        make.centerY.equalTo(icon.mas_centerY);
    }];
    
}
-(void)builCellStyle3{
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = Font(16);
    titleLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    titleLabel.text = @"获得奖杯";
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
    }];
    //奖杯LABEL
    UILabel *jiangbeiLabel = [UILabel new];
    jiangbeiLabel.font = Font(12);
    jiangbeiLabel.textColor = UICOLOR_FROM_HEX(0xefb637);
    jiangbeiLabel.text = @"X230";
    [self.contentView addSubview:jiangbeiLabel];
    [jiangbeiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
    }];
    UIImageView *jiangbei = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-jiangbei"]];
    [self.contentView addSubview:jiangbei];
    [jiangbei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jiangbeiLabel.mas_left).with.offset(-LineW(4));
        make.centerY.equalTo(jiangbeiLabel.mas_centerY);
    }];
    UILabel *tishiLabel = [UILabel new];
    tishiLabel.font = Font(12);
    tishiLabel.text = @"还需努力哦!";
    tishiLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    [self.contentView addSubview:tishiLabel];
    [tishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jiangbei.mas_left).with.offset(-LineX(5));
        make.centerY.equalTo(jiangbei.mas_centerY);
    }];
}
-(void)builCellStyle4{
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = Font(16);
    titleLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    titleLabel.text = @"外交评语";
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
    }];
    for(int i=0;i<5;i++){
        NSString *iconName = @"";
        if(i>1){
            //选中
            iconName = @"icon-xing-xuanzhong";
        }else{
            //未选中
            iconName = @"icon-xing-weixuanzhong";
        }
        UIImageView *xing = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
        CGFloat a = (i * (LineW(16)))+((i+1)*10);
        [self.contentView addSubview:xing];
        [xing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(LineH(16));
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).with.offset(-a);
        }];
    }
}
-(void)builCellStyle5{
    NSString *str = @"When you suffer melancholy and distress, it is best to learn something.Learning will make you invincible.you suffer melancholy and doess, it is best to learn something.Learning will make you invincible.When you suffer melancholy and distress, it is best to learn something.Learning will make you invincible.you suffer melancholy and doess, it is best to learn something.Learning will make you invincible.When you suffer melancholy and distress, it is best to learn something.Learning will make you invincible.you suffer melancholy and doess, it is best to learn something.Learning will make you invincible.When you suffer melancholy and distress, it is best to learn something.Learning will make you invincible.you suffer melancholy and doess, it is best to learn something.Learning will make you invincible.When you suffer melancholy and distress, it is best to learn something.Learning will make you invincible.you suffer melancholy and doess, it is best to learn something.Learning will make you invincible.When you suffer melancholy and distress, it is best to learn something.Learning will make you invincible.you suffer melancholy and doess, it is best to learn something.Learning will make you invincible.";
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.font = Font(14);
    label.textColor = UICOLOR_FROM_HEX(0x333333);
    label.text = str;
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.top.equalTo(self.contentView.mas_top).with.offset(LineH(10));
        make.bottom.equalTo(self.LineView.mas_top).with.offset(-LineH(10));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
