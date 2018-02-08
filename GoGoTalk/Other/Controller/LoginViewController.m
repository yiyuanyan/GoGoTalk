//
//  LoginViewController.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/25.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "CurriculumController.h"
#import "BaseTabBarController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) LoginView *loginView;
@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.loginView = [LoginView new];
    self.loginView.phoneField.delegate = self;
    self.loginView.pwdField.delegate = self;
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    @weakify(self);
    [[self.loginView.forgetPwdBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"忘记密码");
    }];
    [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
//        BaseTabBarController *vc = [BaseTabBarController new];
//        [self.navigationController pushViewController:vc animated:YES];
        [self turnToHomeClick];
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField.tag == 101){
        self.loginView.phoneIcon.image = [UIImage imageNamed:@"icon-shoujihao-hongse"];
        self.loginView.phoneView.layer.borderColor = UICOLOR_FROM_HEX(0xcf121c).CGColor;
        self.loginView.phoneLien.backgroundColor = UICOLOR_FROM_HEX(0xcf121c);
    }
    if(textField.tag == 102){
        self.loginView.pwdIcon.image = [UIImage imageNamed:@"icon-mima-hong"];
        self.loginView.pwdView.layer.borderColor = UICOLOR_FROM_HEX(0xcf121c).CGColor;
        self.loginView.pwdLien.backgroundColor = UICOLOR_FROM_HEX(0xcf121c);
    }
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.tag == 101){
        if(IsStrEmpty(textField.text)){
            self.loginView.phoneIcon.image = [UIImage imageNamed:@"icon-shoujihao-hui"];
            self.loginView.phoneView.layer.borderColor = UICOLOR_FROM_HEX(0xcccccc).CGColor;
            self.loginView.phoneLien.backgroundColor = UICOLOR_FROM_HEX(0xcccccc);
        }
    }
    
    if(textField.tag == 102){
        if(IsStrEmpty(textField.text)){
            self.loginView.pwdIcon.image = [UIImage imageNamed:@"icon-mima-hui"];
            self.loginView.pwdView.layer.borderColor = UICOLOR_FROM_HEX(0xcccccc).CGColor;
            self.loginView.pwdLien.backgroundColor = UICOLOR_FROM_HEX(0xcccccc);
        }
    }
    
}

-(void)turnToHomeClick{
    [UserDefaults() setObject:@"yes" forKey:@"login"];
    [UserDefaults() synchronize];
    BaseTabBarController *tabVc = [[BaseTabBarController alloc] init];
    [self.navigationController pushViewController:tabVc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
