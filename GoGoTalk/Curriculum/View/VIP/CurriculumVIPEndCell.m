//
//  CurriculumVIPEndCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/5.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "CurriculumVIPEndCell.h"
@interface CurriculumVIPEndCell()
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *classNameLabel;
@property(nonatomic, strong) UILabel *teacherNameLabel;
@property(nonatomic, strong) UILabel *classStateLabel;
@property(nonatomic, strong) UIImageView *teacherPhoto;
@end
@implementation CurriculumVIPEndCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self builCell];
    }
    return self;
}
-(void)builCell{
    UIView *LineView = [UIView new];
    LineView.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self.contentView addSubview:LineView];
    [LineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(LineH(10));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
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
        make.top.equalTo(self.classNameLabel.mas_bottom).with.offset(LineH(15));
    }];
}
-(void)setStateCode:(NSInteger)stateCode
{
    //重上按钮、待评价按钮显示
    if(stateCode == 0){
        self.againBtn = [UIButton new];
        [self.againBtn setTitle:@"[ 重上 ]" forState:UIControlStateNormal];
        [self.againBtn setTitleColor:UICOLOR_FROM_HEX(0xffba00) forState:UIControlStateNormal];
        self.againBtn.titleLabel.font = Font(15);
        [self.contentView addSubview:self.againBtn];
        [self.againBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.classNameLabel.mas_centerY);
            make.width.mas_equalTo(LineW(50));
            make.left.equalTo(self.classNameLabel.mas_right).with.offset(LineX(10));
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
    }
    //回放、已评价显示
    if(stateCode > 0){
        self.evealuationBtn = [UIButton new];
        [self.evealuationBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
        [self.evealuationBtn setTitle:@"已评价" forState:UIControlStateNormal];
        self.evealuationBtn.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
        self.evealuationBtn.titleLabel.font = Font(13);
        self.evealuationBtn.layer.masksToBounds = YES;
        self.evealuationBtn.layer.cornerRadius = LineH(32)/2;
        self.evealuationBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
        self.evealuationBtn.layer.borderWidth = 1;
        [self.contentView addSubview:self.evealuationBtn];
        [self.evealuationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineW(86));
            make.height.mas_equalTo(LineH(32));
            make.right.mas_equalTo(-LineW(10));
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-LineH(20));
        }];
        //回放按钮
        self.replayBtn = [[UIButton alloc] init];
        [self.replayBtn setImage:[UIImage imageNamed:@"icon-huifang"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.replayBtn];
        [self.replayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(LineH(16));
            make.centerY.equalTo(self.timeLabel.mas_centerY);
            make.left.equalTo(self.timeLabel.mas_right).with.offset(LineX(10));
        }];
    }
    UILabel *tishiLabel = [UILabel new];
    tishiLabel.font = Font(12);
    tishiLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    if(stateCode == 1){
        tishiLabel.text = @"迟到";
    }
    if(stateCode == 2){
        tishiLabel.text = @"缺席";
    }
    [tishiLabel sizeToFit];
    [self.contentView addSubview:tishiLabel];
    [tishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
    }];
    //奖杯图片和label
    UIImageView *jiangbei = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-jiangbei"]];
    [self.contentView addSubview:jiangbei];
    [jiangbei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.teacherNameLabel.mas_centerY);
        make.left.equalTo(self.teacherNameLabel.mas_right).with.offset(LineX(10));
        make.height.width.mas_equalTo(LineW(14));
    }];
    UILabel *jiangbeiLabel = [UILabel new];
    jiangbeiLabel.font = Font(14);
    jiangbeiLabel.text = @"X230";
    jiangbeiLabel.textColor = UICOLOR_FROM_HEX(0xefb637);
    [self.contentView addSubview:jiangbeiLabel];
    [jiangbeiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(jiangbei.mas_centerY);
        make.left.equalTo(jiangbei.mas_right).with.offset(LineX(4));
    }];
    if(stateCode == 5){
        //老师缺席状态
        UILabel *teachAbsentLabel = [UILabel new];
        teachAbsentLabel.font = Font(12);
        teachAbsentLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
        teachAbsentLabel.text = @"老师缺席，课时已返还";
        [self.contentView addSubview:teachAbsentLabel];
        [teachAbsentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLabel.mas_left);
            make.top.equalTo(self.teacherPhoto.mas_bottom).with.offset(LineH(5));
        }];
    }
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
