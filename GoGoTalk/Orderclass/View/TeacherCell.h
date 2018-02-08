//
//  TeacherCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/7.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TeacherCellButtonDelegate<NSObject>
@optional
-(void)didClickCellButton:(UIButton *)button;
@end
@interface TeacherCell : UITableViewCell
@property(nonatomic, strong) id<TeacherCellButtonDelegate>delegate;
@property(nonatomic, strong) UIButton *teacherPhotoBtn;  //老师头像按钮
@property(nonatomic, assign) NSInteger stateCode;  //状态码 临时
@property(nonatomic, strong) UIButton *followOn;  //未关注
@property(nonatomic, strong) UIButton *followOff;  //已关注
@property(nonatomic, strong) UIButton *bespeakBtn;  //预约按钮
@end
