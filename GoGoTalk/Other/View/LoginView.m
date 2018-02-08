//
//  LoginView.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/29.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "LoginView.h"
@interface LoginView()

@end
@implementation LoginView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self builLoginView];
    }
    return self;
}
-(void)builLoginView{
    UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    [self addSubview:logoImage];
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(LineH(170));
        make.width.mas_equalTo(LineW(160));
        make.height.mas_equalTo(LineH(48));
        make.centerX.equalTo(self.mas_centerX);
    }];
    //手机号码
    self.phoneView = [UIView new];
    self.phoneView.layer.masksToBounds = YES;
    self.phoneView.layer.cornerRadius = 6.0f;
    self.phoneView.layer.borderColor = UICOLOR_FROM_HEX(0xcccccc).CGColor;
    self.phoneView.layer.borderWidth = 1.0;
    [self addSubview:self.phoneView];
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(335));
        make.height.mas_equalTo(LineH(44));
        make.top.equalTo(logoImage.mas_bottom).with.offset(LineY(40));
        make.centerX.equalTo(self.mas_centerX);
    }];
    self.phoneIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-shoujihao-hui"]];
    [self.phoneView addSubview:self.phoneIcon];
    [self.phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(14));
        make.height.mas_equalTo(LineH(20));
        make.centerY.equalTo(self.phoneView.mas_centerY);
        make.left.equalTo(self.phoneView.mas_left).with.offset(LineX(14));
    }];
    self.phoneLien = [UIView new];
    self.phoneLien.backgroundColor = UICOLOR_FROM_HEX(0xcccccc);
    [self.phoneView addSubview:self.phoneLien];
    [self.phoneLien mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneIcon.mas_right).with.offset(LineX(14));
        make.width.mas_equalTo(1);
        make.top.equalTo(self.phoneView.mas_top);
        make.height.equalTo(self.phoneView.mas_height);
    }];
    self.phoneField = [[UITextField alloc] init];
    self.phoneField.tag = 101;
    self.phoneField.placeholder = @"请输入手机号码";
    [self.phoneView addSubview:self.phoneField];
    [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLien.mas_right).with.offset(LineX(5));
        make.top.equalTo(self.phoneView.mas_top);
        make.height.equalTo(self.phoneView.mas_height);
        make.right.equalTo(self.phoneView.mas_right).with.offset(-LineX(5));
    }];
    //密码
    self.pwdView = [UIView new];
    self.pwdView.layer.masksToBounds = YES;
    self.pwdView.layer.cornerRadius = 6.0f;
    self.pwdView.layer.borderColor = UICOLOR_FROM_HEX(0xcccccc).CGColor;
    self.pwdView.layer.borderWidth = 1.0;
    [self addSubview:self.pwdView];
    [self.pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(335));
        make.height.mas_equalTo(LineH(44));
        make.top.equalTo(self.phoneView.mas_bottom).with.offset(LineY(20));
        make.centerX.equalTo(self.mas_centerX);
    }];
    self.pwdIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-mima-hui"]];
    [self.pwdView addSubview:self.pwdIcon];
    [self.pwdIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.phoneIcon.mas_centerX);
        make.centerY.equalTo(self.pwdView.mas_centerY);
    }];
    self.pwdLien = [UIView new];
    self.pwdLien.backgroundColor = UICOLOR_FROM_HEX(0xcccccc);
    [self.pwdView addSubview:self.pwdLien];
    [self.pwdLien mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.phoneLien.mas_centerX);
        make.top.equalTo(self.pwdView.mas_top);
        make.height.equalTo(self.pwdView.mas_height);
        make.width.mas_equalTo(1);
    }];
    self.pwdField = [[UITextField alloc] init];
    self.pwdField.placeholder = @"请输入密码";
    self.pwdField.secureTextEntry = YES;
    self.pwdField.tag = 102;
    [self.pwdView addSubview:self.pwdField];
    [self.pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pwdLien.mas_right).with.offset(LineX(5));
        make.top.equalTo(self.pwdView.mas_top);
        make.height.equalTo(self.pwdView.mas_height);
        make.right.equalTo(self.pwdView.mas_right).with.offset(-LineX(5));
    }];
    //忘记密码
    self.forgetPwdBtn = [[UIButton alloc] init];
    [self.forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgetPwdBtn setTitleColor:UICOLOR_FROM_HEX(0xcccccc) forState:UIControlStateNormal];
    [self.forgetPwdBtn sizeToFit];
    [self addSubview:self.forgetPwdBtn];
    [self.forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.pwdView.mas_right);
        make.top.equalTo(self.pwdView.mas_bottom).with.offset(10);
    }];
    //登录按钮
    self.loginBtn = [[UIButton alloc] init];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [self.loginBtn setTitle:@"登   录" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = UICOLOR_FROM_HEX(0xcf121c);
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = LineH(44)/2;
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LineW(310));
        make.height.mas_equalTo(LineH(44));
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.forgetPwdBtn.mas_bottom).with.offset(LineH(30));
    }];
    //注册
    self.registerBtn = [UIButton new];
    [self.registerBtn setTitleColor:UICOLOR_FROM_HEX(0xcf121c) forState:UIControlStateNormal];
    [self.registerBtn setTitle:@"注   册" forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.layer.borderWidth = 1;
    self.registerBtn.layer.borderColor = UICOLOR_FROM_HEX(0xcf121c).CGColor;
    self.registerBtn.layer.cornerRadius = LineH(44)/2;
    [self addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginBtn.mas_left);
        make.right.equalTo(self.loginBtn.mas_right);
        make.height.mas_equalTo(LineH(44));
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(LineH(20));
    }];
    
    UIImageView *bottomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beijing-dibu"]];
    [self addSubview:bottomImage];
    [bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
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
