//
//  ClassEvaluateView.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/6.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "ClassEvaluateView.h"

@implementation ClassEvaluateView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self builClassEvaluateView];
    }
    return self;
}
-(void)builClassEvaluateView
{
    //教师满意度
    UILabel *satisfaction = [UILabel new];
    satisfaction.font = Font(12);
    satisfaction.text = @"教师满意度";
    satisfaction.textColor = UICOLOR_FROM_HEX(0x999999);
    [self addSubview:satisfaction];
    [satisfaction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(15));
        make.top.equalTo(self.mas_top).with.offset(LineX(15));
    }];
    UIView *satisfactionView = [UIView new];
    satisfactionView.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
    [self addSubview:satisfactionView];
    [satisfactionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(LineH(49));
        make.top.equalTo(satisfaction.mas_bottom).with.offset(LineH(6));
    }];
    UILabel *satisfaction2 = [UILabel new];
    satisfaction2.textColor = UICOLOR_FROM_HEX(0x333333);
    satisfaction2.text = @"和老师互动非常开心";
    satisfaction2.font = Font(16);
    [satisfactionView addSubview:satisfaction2];
    [satisfaction2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(satisfactionView.mas_centerY);
        make.left.equalTo(satisfactionView.mas_left).with.offset(LineX(15));
    }];
    //满意度三个按钮
    self.satisfiedBtn1 = [UIButton new];
    [self.satisfiedBtn1 setImage:[UIImage imageNamed:@"icon-xing-xuanzhong"] forState:UIControlStateNormal];
    self.satisfiedBtn1.tag = 101;
    [satisfactionView addSubview:self.satisfiedBtn1];
    [self.satisfiedBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineW(16));
        make.centerY.equalTo(satisfactionView.mas_centerY);
        make.right.equalTo(satisfactionView.mas_right).with.offset(-LineX(62));
    }];
    
    self.satisfiedBtn2 = [UIButton new];
    [self.satisfiedBtn2 setImage:[UIImage imageNamed:@"icon-xing-xuanzhong"] forState:UIControlStateNormal];
    self.satisfiedBtn2.tag = 102;
    [satisfactionView addSubview:self.satisfiedBtn2];
    [self.satisfiedBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineW(16));
        make.centerY.equalTo(satisfactionView.mas_centerY);
        make.left.equalTo(self.satisfiedBtn1.mas_right).with.offset(LineX(10));
    }];
    self.satisfiedBtn3 = [UIButton new];
    [self.satisfiedBtn3 setImage:[UIImage imageNamed:@"icon-xing-xuanzhong"] forState:UIControlStateNormal];
    self.satisfiedBtn3.tag = 103;
    [satisfactionView addSubview:self.satisfiedBtn3];
    [self.satisfiedBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineW(16));
        make.centerY.equalTo(satisfactionView.mas_centerY);
        make.left.equalTo(self.satisfiedBtn2.mas_right).with.offset(LineX(10));
    }];
    //本节课效果
    UILabel *effectLabel = [UILabel new];
    effectLabel.font = Font(12);
    effectLabel.text = @"本节课学习效果";
    effectLabel.textColor = UICOLOR_FROM_HEX(0x999999);
    [self addSubview:effectLabel];
    [effectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(satisfaction.mas_left);
        make.top.equalTo(satisfactionView.mas_bottom).with.offset(LineH(15));
    }];
    UIView *effectView = [UIView new];
    effectView.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
    [self addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(effectLabel.mas_bottom).with.offset(LineH(6));
        make.height.mas_equalTo(LineH(49));
    }];
    UILabel *effectLabel2 = [UILabel new];
    effectLabel2.font = Font(16);
    effectLabel2.textColor = UICOLOR_FROM_HEX(0x333333);
    effectLabel2.text = @"完全不记得";
    [effectView addSubview:effectLabel2];
    [effectLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(effectView.mas_centerY);
        make.left.equalTo(self.mas_left).with.offset(LineX(15));
    }];
    //效果三个按钮
    self.effectBtn1 = [UIButton new];
    [self.effectBtn1 setImage:[UIImage imageNamed:@"icon-xing-xuanzhong"] forState:UIControlStateNormal];
    self.effectBtn1.tag = 201;
    [effectView addSubview:self.effectBtn1];
    [self.effectBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineH(16));
        make.centerY.equalTo(effectView.mas_centerY);
        make.right.equalTo(effectView.mas_right).with.offset(-LineX(62));
    }];
    self.effectBtn2 = [UIButton new];
    [self.effectBtn2 setImage:[UIImage imageNamed:@"icon-xing-weixuanzhong"] forState:UIControlStateNormal];
    self.effectBtn2.tag = 202;
    [effectView addSubview:self.effectBtn2];
    [self.effectBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineH(16));
        make.centerY.equalTo(effectView.mas_centerY);
        make.left.equalTo(self.effectBtn1.mas_right).with.offset(LineX(10));
    }];
    self.effectBtn3 = [UIButton new];
    [self.effectBtn3 setImage:[UIImage imageNamed:@"icon-xing-weixuanzhong"] forState:UIControlStateNormal];
    self.effectBtn3.tag = 203;
    [effectView addSubview:self.effectBtn3];
    [self.effectBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineH(16));
        make.centerY.equalTo(effectView.mas_centerY);
        make.left.equalTo(self.effectBtn2.mas_right).with.offset(LineX(10));
    }];
    //评语
    UILabel *remarkLabel = [UILabel new];
    remarkLabel.font = Font(12);
    remarkLabel.text = @"学员评语";
    remarkLabel.textColor = UICOLOR_FROM_HEX(0x999999);
    [self addSubview:remarkLabel];
    [remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(15));
        make.top.equalTo(effectView.mas_bottom).with.offset(LineH(15));
    }];
    //评论输入框
    UIView *remarkView = [UIView new];
    remarkView.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
    [self addSubview:remarkView];
    [remarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(remarkLabel.mas_bottom).with.offset(LineH(6));
        make.height.mas_equalTo(LineH(140));
    }];
    self.remarkTextView = [[UITextView alloc] init];
    self.textViewStr = [UILabel new];
    self.textViewStr.font = Font(14);
    self.textViewStr.text = @"请留下您对这节课和外教老师的评价 (200字以内)";
    self.textViewStr.textColor = UICOLOR_FROM_HEX(0xcccccc);
    [self.remarkTextView addSubview:self.textViewStr];
    [self.textViewStr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.remarkTextView);
        make.top.equalTo(self.remarkTextView.mas_top).with.offset(7);
    }];
    [remarkView addSubview:self.remarkTextView];
    [self.remarkTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(remarkView.mas_top).with.offset(10);
        make.left.equalTo(remarkView.mas_left).with.offset(10);
        make.right.equalTo(remarkView.mas_right).with.offset(-10);
        make.bottom.equalTo(remarkView.mas_bottom).with.offset(-10);
    }];
    
    self.saveBtn = [UIButton new];
    [self.saveBtn setTitle:@"确  定" forState:UIControlStateNormal];
    [self.saveBtn setTitleColor:UICOLOR_FROM_HEX(0xffffff) forState:UIControlStateNormal];
    self.saveBtn.backgroundColor = UICOLOR_FROM_HEX(0xea5851);
    self.saveBtn.layer.masksToBounds = YES;
    self.saveBtn.layer.cornerRadius = LineH(44)/2;
    [self addSubview:self.saveBtn];
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineW(31));
        make.right.equalTo(self.mas_right).with.offset(-LineW(31));
        make.top.equalTo(remarkView.mas_bottom).with.offset(LineH(40));
        make.height.mas_equalTo(LineH(44));
    }];
}

@end
