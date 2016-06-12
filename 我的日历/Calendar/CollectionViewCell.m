//
//  CollectionViewCell.m
//  Calendar
//
//  Created by 魏威 on 16/4/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "CollectionViewCell.h"
#define Kwidth  self.frame.size.width
#define Kheight (self.frame.size.height)/10
@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        //创建控件
        [self setUpSubViews];
        self.layer.borderColor = [[UIColor grayColor]CGColor];
        self.layer.borderWidth = 2.0;
        self.backgroundColor = [UIColor whiteColor];
        [self layoutIfNeeded];
    }return self;
}

-(void)setUpSubViews{
    //假期
    self.holidayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight*3)];
    
    _holidayLabel.textAlignment = NSTextAlignmentRight;
    _holidayLabel.backgroundColor = [UIColor clearColor];
    //_holidayLabel.text = @"假期";
    _holidayLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_holidayLabel];
    
    
    //阳历
    self.gregorianLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_holidayLabel.frame), Kwidth, Kheight*4)];
    _gregorianLabel.textAlignment = NSTextAlignmentCenter;
    _gregorianLabel.backgroundColor = [UIColor clearColor];
    _gregorianLabel.font = [UIFont systemFontOfSize:22];
    [self.contentView addSubview:_gregorianLabel];
    //阴历
    self.lunarLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_gregorianLabel.frame), Kwidth, Kheight*3)];
    _lunarLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_lunarLabel];
    //_lunarLabel.text = @"农历";
    _lunarLabel.  font = [UIFont systemFontOfSize:10];
    _lunarLabel.textAlignment = NSTextAlignmentCenter;

}








@end
