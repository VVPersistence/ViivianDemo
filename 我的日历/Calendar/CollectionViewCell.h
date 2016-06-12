//
//  CollectionViewCell.h
//  Calendar
//
//  Created by 魏威 on 16/4/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
///假期
@property(nonatomic,strong)UILabel * holidayLabel;
///公历
@property(nonatomic,strong)UILabel * gregorianLabel;
///农历
@property(nonatomic,strong)UILabel * lunarLabel;



@end
