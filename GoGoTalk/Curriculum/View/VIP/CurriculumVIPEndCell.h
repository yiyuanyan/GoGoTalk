//
//  CurriculumVIPEndCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/5.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurriculumVIPEndCell : UITableViewCell
@property(nonatomic, assign) NSInteger stateCode;  //状态码，临时
@property(nonatomic, strong) UIButton *againBtn;  //重上按钮
@property(nonatomic, strong) UIButton *waitEvealuationBtn;  //未评价按钮
@property(nonatomic, strong) UIButton *evealuationBtn;  //已评价按钮
@property(nonatomic, strong) UIButton *replayBtn;  //回放按钮
@end
