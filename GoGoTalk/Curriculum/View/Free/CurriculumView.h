//
//  CurriculumView.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/1/30.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurriculumView : UIView
@property(nonatomic, assign) int stateCode;
//课程体系BUTTON
@property(nonatomic, strong) UIButton *kcBtn;
//师资服务BUTTON
@property(nonatomic, strong) UIButton *szBtn;
/* --------已预约 -- 准备上课-------- */
@property(nonatomic, strong) UIButton *enterClassRoomBtn;  //进入教室
@property(nonatomic, strong) UIButton *previewBtn;  //课前预习
@property(nonatomic, strong) UIButton *noticeBtn;  //上课须知
/* --------已预约 -- 缺席-------- */
@property(nonatomic, strong) UIButton *kefuBtn;  //拨打客服电话
/* ---------评测报告---------------- */
@property(nonatomic, strong) UIButton *reportBtn;  //查看评测报告
@end
