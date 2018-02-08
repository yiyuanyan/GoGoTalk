//
//  LoginView.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/29.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
//手机号码
@property(nonatomic, strong) UIView *phoneView;
@property(nonatomic, strong) UIView *phoneLien;
@property(nonatomic, strong) UIImageView *phoneIcon;
@property(nonatomic, strong) UITextField *phoneField;
//密码
@property(nonatomic, strong) UIView *pwdView;
@property(nonatomic, strong) UIView *pwdLien;
@property(nonatomic, strong) UIImageView *pwdIcon;
@property(nonatomic, strong) UITextField *pwdField;
//忘记密码
@property(nonatomic, strong) UIButton *forgetPwdBtn;
//登录按钮
@property(nonatomic, strong) UIButton *loginBtn;
//注册按钮
@property(nonatomic, strong) UIButton *registerBtn;
@end
