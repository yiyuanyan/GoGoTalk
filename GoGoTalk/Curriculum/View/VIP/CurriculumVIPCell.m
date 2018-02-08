//
//  CurriculumVIPCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/2.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "CurriculumVIPCell.h"
@interface CurriculumVIPCell()
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *classNameLabel;
@property(nonatomic, strong) UILabel *teacherNameLabel;
@property(nonatomic, strong) UILabel *classStateLabel;
@property(nonatomic, strong) UIImageView *classStateIcon;
@end
@implementation CurriculumVIPCell
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
    UIImageView *teacherPhoto = [UIImageView new];
    teacherPhoto.backgroundColor = [UIColor whiteColor];
    teacherPhoto.layer.masksToBounds = YES;
    teacherPhoto.layer.cornerRadius = LineH(60)/2;
    teacherPhoto.layer.borderColor = UICOLOR_FROM_HEX(0xF2F2F2).CGColor;
    teacherPhoto.layer.borderWidth = 1.0;
    [self.contentView addSubview:teacherPhoto];
    [teacherPhoto mas_makeConstraints:^(MASConstraintMaker *make) {
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
        make.left.equalTo(teacherPhoto.mas_right).with.offset(LineH(5));
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
    self.classStateIcon = [UIImageView new];
    [self.contentView addSubview:self.classStateIcon];
    [self.classStateIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(LineH(18));
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.centerY.equalTo(self.timeLabel.mas_centerY);
    }];
    
    
    self.classStateLabel = [UILabel new];
    self.classStateLabel.font = Font(12);
    
    self.classStateLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    [self.contentView addSubview:self.classStateLabel];
    [self.classStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel.mas_centerY);
        make.right.equalTo(self.classStateIcon.mas_left).with.offset(-LineX(5));
    }];
    if(stateCode == 0){
        self.classStateLabel.text = @"正在上课";
        self.classStateIcon.image = [UIImage imageNamed:@"kb-icon-zzsk"];
        
    }else if(stateCode == 1){
        self.classStateLabel.text = @"即将上课";
        self.classStateIcon.image = [UIImage imageNamed:@"kb-icon-jjkk"];
        [self.classStateIcon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(16);
            make.height.mas_equalTo(LineH(19));
        }];
    }
    //重上按钮显示
    if(stateCode == 2){
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
    }
    //进入教室按钮显示
    if(stateCode == 0 || stateCode == 1){
        self.inClassRoomBtn = [UIButton new];
        [self.inClassRoomBtn setTitle:@"进入教室" forState:UIControlStateNormal];
        [self.inClassRoomBtn setTitleColor:UICOLOR_FROM_HEX(0xffffff) forState:UIControlStateNormal];
        self.inClassRoomBtn.titleLabel.font = Font(13);
        self.inClassRoomBtn.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
        self.inClassRoomBtn.layer.masksToBounds = YES;
        self.inClassRoomBtn.layer.cornerRadius = LineH(32)/2;
        
        [self.contentView addSubview:self.inClassRoomBtn];
        [self.inClassRoomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineW(86));
            make.height.mas_equalTo(LineH(32));
            make.right.mas_equalTo(-LineW(10));
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-LineH(20));
        }];
    }
    //预习课件按钮显示
    if(stateCode == 2 || stateCode == 3){
        self.previewBtn = [UIButton new];
        [self.previewBtn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
        [self.previewBtn setTitle:@"预习课件" forState:UIControlStateNormal];
        self.previewBtn.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
        self.previewBtn.titleLabel.font = Font(13);
        self.previewBtn.layer.masksToBounds = YES;
        self.previewBtn.layer.cornerRadius = LineH(32)/2;
        self.previewBtn.layer.borderColor = UICOLOR_FROM_HEX(0xea5851).CGColor;
        self.previewBtn.layer.borderWidth = 1;
        [self.contentView addSubview:self.previewBtn];
        [self.previewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineW(86));
            make.height.mas_equalTo(LineH(32));
            make.right.mas_equalTo(-LineW(10));
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-LineH(20));
        }];
        
    }
    //取消预约按钮显示
    if(stateCode > 2){
        self.cancelBtn = [UIButton new];
        [self.cancelBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
        [self.cancelBtn setTitle:@"取消预约" forState:UIControlStateNormal];
        self.cancelBtn.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
        self.cancelBtn.titleLabel.font = Font(13);
        self.cancelBtn.layer.masksToBounds = YES;
        self.cancelBtn.layer.cornerRadius = LineH(32)/2;
        self.cancelBtn.layer.borderColor = UICOLOR_FROM_HEX(0x666666).CGColor;
        self.cancelBtn.layer.borderWidth = 1;
        [self.contentView addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineW(86));
            make.height.mas_equalTo(LineH(32));
            if(self.previewBtn == nil){
                make.right.mas_equalTo(-LineW(10));
            }else{
                make.right.equalTo(self.previewBtn.mas_left).with.offset(-LineW(15));
            }
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-LineH(20));
        }];
    }
}
@end
