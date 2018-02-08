//
//  BaseTabBarController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseTabBarController.h"
#import "CurriculumController.h"
#import "BaseNavigationController.h"
#import "OrderclassController.h"
#import "MineController.h"
//#import "ProductionController.h"
//#import "OccupationController.h"
//#import "AnnihilationController.h"
//#import "OccupationViewController.h"
//#import "ProductionViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = UICOLOR_FROM_HEX(kThemeColor);
    //设置tabbar不透明
    self.tabBar.translucent = NO;
    //设置视图
    [self setupChildControllers];
    
}

- (void)setupChildControllers {
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"kebiao" rootViewControllerClass:[CurriculumController class] tabbarTitle:@"课表"];
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"yueke" rootViewControllerClass:[OrderclassController class] tabbarTitle:@"约课"];
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"wode" rootViewControllerClass:[MineController class] tabbarTitle:@"我的"];
    
    
}
/*
- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UINavigationController *navigation = (UINavigationController *)viewController;
    CrusadeViewController *cv = (CrusadeViewController *)navigation.topViewController;
    [cv refreshData];
}
//禁止tab多次点击
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    UIViewController *tbselect = tabBarController.selectedViewController;
    if([tabBarController isEqual:viewController]){
        return NO;
    }
    return YES;
}*/

-(void)setupChildNavigationControllerWithClass:(Class)class tabbarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass tabbarTitle:(NSString *)title{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.title = title;
    navVc.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@-yi", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    
    //设置字体偏移量，防止字体偏下
    [navVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(-3, -3)];
    
    //设置tabbar的颜色以及字体大小
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = UICOLOR_FROM_HEX(0x666666);
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = UICOLOR_FROM_HEX(kThemeColor);
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:navVc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
