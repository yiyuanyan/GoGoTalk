//
//  ClassEvaluateView.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/6.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassEvaluateView : UIView
//满意度三个按钮
@property(nonatomic, strong) UIButton *satisfiedBtn1;
@property(nonatomic, strong) UIButton *satisfiedBtn2;
@property(nonatomic, strong) UIButton *satisfiedBtn3;
//学习效果三个按钮
@property(nonatomic, strong) UIButton *effectBtn1;
@property(nonatomic, strong) UIButton *effectBtn2;
@property(nonatomic, strong) UIButton *effectBtn3;
//输入框
@property(nonatomic, strong) UITextView *remarkTextView;
@property(nonatomic, strong) UILabel *textViewStr;
//保存按钮
@property(nonatomic, strong) UIButton *saveBtn;
@end
