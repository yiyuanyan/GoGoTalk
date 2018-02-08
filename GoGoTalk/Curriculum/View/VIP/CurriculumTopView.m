//
//  CurriculumTopView.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/2.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "CurriculumTopView.h"

@implementation CurriculumTopView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self builButtons];
    }
    return self;
}
-(void)builButtons{
    self.noClassBtn = [UIButton new];
    self.noClassBtn.tag = 101;
    [self.noClassBtn setTitle:@"未结课（4）" forState:UIControlStateNormal];
    [self.noClassBtn setTitleColor:UICOLOR_FROM_HEX(0x333333) forState:UIControlStateNormal];
    self.noClassBtn.titleLabel.font = Font(16);
    [self addSubview:self.noClassBtn];
    [self.noClassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.width.mas_equalTo(SCREEN_WIDTH()/2);
        make.height.mas_equalTo(LineH(46));
        make.left.equalTo(self.mas_left);
    }];
    self.endClassBtn = [UIButton new];
    self.endClassBtn.tag = 102;
    [self.endClassBtn setTitle:@"已结课（99）" forState:UIControlStateNormal];
    [self.endClassBtn setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:UIControlStateNormal];
    self.endClassBtn.titleLabel.font = Font(16);
    [self addSubview:self.endClassBtn];
    [self.endClassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.width.mas_equalTo(SCREEN_WIDTH()/2);
        make.height.mas_equalTo(LineH(46));
        make.left.equalTo(self.noClassBtn.mas_right);
    }];
    self.btnBottomView = [UIView new];
    self.btnBottomView.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    [self addSubview:self.btnBottomView];
    [self.btnBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(64));
        make.height.mas_equalTo(3);
        make.centerX.equalTo(self.noClassBtn.mas_centerX);
        make.top.equalTo(self.noClassBtn.mas_bottom);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
