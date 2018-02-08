//
//  AppDelegate.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/25.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import <AVFoundation/AVFoundation.h>
#import <UMSocialCore/UMSocialCore.h>
#import <Bugly/Bugly.h>
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"
#import "LoginViewController.h"
#import "NewFeatherViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self builKeyWindow];
    [self initIQKeyboardManager];
    return YES;
}
-(void)builKeyWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    BaseTabBarController *tabVc = [BaseTabBarController new];
    LoginViewController *loginVc = [LoginViewController new];
    NewFeatherViewController *newfeatherVc = [NewFeatherViewController new];
    //获取当前版本号
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *key = @"version";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [userDefaults objectForKey:key];
    //当前版本等于最后记录版本
    if([currentVersion isEqualToString:lastVersion]){
        if([[userDefaults objectForKey:@"login"] isEqualToString:@"yes"]){
            self.window.rootViewController = tabVc;
            tabVc.tabBarController.selectedIndex = 2;
        }else{
            BaseNavigationController *mainVc = [[BaseNavigationController alloc] initWithRootViewController:loginVc];
            self.window.rootViewController = mainVc;
        }
    }else{
        [userDefaults setObject:currentVersion forKey:key];
        self.window.rootViewController = newfeatherVc;
    }
    [self.window makeKeyAndVisible];
}
//初始化IQKeyboardManager
-(void)initIQKeyboardManager{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
