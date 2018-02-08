//
//  CurriculumVIPCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/2.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurriculumVIPCell : UITableViewCell
@property(nonatomic, assign) NSInteger stateCode;  //状态码，临时
@property(nonatomic, strong) UIButton *againBtn;  //重上按钮
@property(nonatomic, strong) UIButton *inClassRoomBtn;  //进入教室
@property(nonatomic, strong) UIButton *previewBtn;  //课前预习
@property(nonatomic, strong) UIButton *cancelBtn;  //取消课程
@end
