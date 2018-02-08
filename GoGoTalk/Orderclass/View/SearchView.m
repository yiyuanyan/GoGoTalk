//
//  SearchView.m
//  GoGoTalk
//
//  Created by 何建新 on 2018/2/6.
//  Copyright © 2018年 何建新. All rights reserved.
//

#import "SearchView.h"
@interface SearchView()

@end
@implementation SearchView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self builSearchView];
    }
    return self;
}
-(void)builSearchView{
    UIView *searchBackgroundView = [UIView new];
    searchBackgroundView.backgroundColor = UICOLOR_FROM_HEX(0xffffff);
    [self addSubview:searchBackgroundView];
    [searchBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_equalTo(LineH(49));
    }];
    self.search = [UIView new];
    self.search.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    self.search.layer.masksToBounds = YES;
    self.search.layer.cornerRadius = LineH(29)/2;
    [searchBackgroundView addSubview:self.search];
    [self.search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchBackgroundView.mas_left).with.offset(LineW(10));
        make.right.equalTo(searchBackgroundView.mas_right).with.offset(-LineW(10));
        make.centerY.equalTo(searchBackgroundView.mas_centerY);
        make.height.mas_equalTo(LineH(29));
    }];
    UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-shijian"]];
    [self.search addSubview:searchIcon];
    [searchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.search.mas_left).with.offset(LineX(15));
        make.centerY.equalTo(self.search.mas_centerY);
        make.width.height.mas_equalTo(LineH(14));
    }];
    self.timeLabel = [UILabel new];
    self.timeLabel.font = Font(14);
    self.timeLabel.textColor = UICOLOR_FROM_HEX(0x666666);
    self.timeLabel.text = @"12月18日（周一）10:30";
    [self.search addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchIcon.mas_right).with.offset(LineX(10));
        make.centerY.equalTo(self.search.mas_centerY);
    }];
    UIImageView *rightIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-saixuan"]];
    [self.search addSubview:rightIcon];
    [rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(LineH(14));
        make.centerY.equalTo(self.search.mas_centerY);
        make.right.equalTo(self.search.mas_right).with.offset(-LineX(15));
    }];
    
    self.con = [[UIControl alloc] init];
    //[con addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.con];
    [self.con mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
