//
//  ClassInfoCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/5.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassInfoCell : UITableViewCell
@property(nonatomic, assign) NSInteger row;
@property(nonatomic, strong) UIView *LineView;
@property(nonatomic, strong) UIButton *againBtn;  //重上按钮
@property(nonatomic, strong) UIButton *waitEvealuationBtn;  //未评价按钮
@property(nonatomic, strong) UIButton *evealuationBtn;  //已评价按钮
@end
