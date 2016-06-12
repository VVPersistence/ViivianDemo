//
//  DateHelper.h
//  Calendar
//
//  Created by 魏威 on 16/4/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;
@property (nonatomic, copy) void(^calendarBlock)(NSInteger day, NSInteger month, NSInteger year);

+(DateHelper*)shareDateHelper;
//天
- (NSInteger)day;
//月
- (NSInteger)month;
//年
- (NSInteger)year;
//本月第一个星期天
- (NSInteger)firstWeekdayInThisMonth;
//本月的天数
- (NSInteger)totaldaysInThisMonth;
- (NSInteger)totaldaysInMonth;
//上个月
- (NSDate *)lastMonth;
//下个月
- (NSDate*)nextMonth;

@end
