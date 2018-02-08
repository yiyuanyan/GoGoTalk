//
//  TeacherCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/7.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "TeacherCell.h"
@interface TeacherCell()
@property(nonatomic, strong) UILabel *teacherName;
@end
@implementation TeacherCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self builCell];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)builCell{
    UIView *LineView = [UIView new];
    LineView.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self.contentView addSubview:LineView];
    [LineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    self.teacherPhotoBtn = [UIButton new];
    self.teacherPhotoBtn.titleLabel.text = @"老师头像";
    self.teacherPhotoBtn.layer.masksToBounds = YES;
    self.teacherPhotoBtn.layer.cornerRadius = LineH(61)/2;
    self.teacherPhotoBtn.layer.borderColor = UICOLOR_FROM_HEX(0xf2f2f2).CGColor;
    self.teacherPhotoBtn.layer.borderWidth = 1;
    [self.teacherPhotoBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.teacherPhotoBtn];
    [self.teacherPhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.width.height.mas_equalTo(LineH(61));
    }];
    //老师名称
    self.teacherName = [UILabel new];
    self.teacherName.text = @"Ruisun";
    self.teacherName.textColor = UICOLOR_FROM_HEX(0x333333);
    self.teacherName.font = Font(16);
    [self.contentView addSubview:self.teacherName];
    [self.teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherPhotoBtn.mas_right).with.offset(LineW(15));
        make.top.equalTo(self.teacherPhotoBtn.mas_top).with.offset(LineH(3));
    }];
    self.bespeakBtn = [UIButton new];
    [self.bespeakBtn setTitle:@"预约" forState:UIControlStateNormal];
    [self.bespeakBtn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
    [self.bespeakBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.bespeakBtn.layer.masksToBounds = YES;
    self.bespeakBtn.layer.cornerRadius = LineH(31)/2;
    self.bespeakBtn.titleLabel.font = Font(13);
    self.bespeakBtn.layer.borderColor = UICOLOR_FROM_HEX(0xea5851).CGColor;
    self.bespeakBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.bespeakBtn];
    [self.bespeakBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.width.mas_equalTo(LineW(66));
        make.height.mas_equalTo(LineH(31));
    }];
    
}
-(void)setStateCode:(NSInteger)stateCode
{
    self.bespeakBtn.tag = 200 + stateCode;
    self.teacherPhotoBtn.tag = 100 + stateCode;
    if(stateCode == 3){
        //未关注按钮
        self.followOn = [UIButton new];
        self.followOn.titleLabel.text = @"关注";
        self.followOn.tag = 300 + stateCode;
        [self.followOn setImage:[UIImage imageNamed:@"icon-guanzhu-da"] forState:UIControlStateNormal];
        [self.followOn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.followOn];
        [self.followOn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineW(56));
            make.height.mas_equalTo(LineH(24));
            make.top.equalTo(self.teacherName.mas_bottom).with.offset(LineH(10));
            make.left.equalTo(self.teacherName.mas_left);
        }];
    }else{
        //已关注
        self.followOff = [UIButton new];
        self.followOff.titleLabel.text = @"取消关注";
        self.followOff.tag = 300 + stateCode;
        [self.followOff setImage:[UIImage imageNamed:@"icon-quxiaoguanzhu"] forState:UIControlStateNormal];
        [self.followOff addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.followOff];
        [self.followOff mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineW(56));
            make.height.mas_equalTo(LineH(24));
            make.top.equalTo(self.teacherName.mas_bottom).with.offset(LineH(10));
            make.left.equalTo(self.teacherName.mas_left);
        }];
    }
}
-(void)buttonClick:(UIButton *)button
{
    [self.delegate didClickCellButton:button];
}
@end
