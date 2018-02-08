//
//  CurriculumTopView.h
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/2.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurriculumTopView : UIView
@property(nonatomic, strong) UIButton *noClassBtn; //未上课
@property(nonatomic, strong) UIButton *endClassBtn;  //已结课
@property(nonatomic, strong) UIView *btnBottomView;  //按钮底部标识
@end
