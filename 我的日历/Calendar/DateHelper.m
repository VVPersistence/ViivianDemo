//
//  DateHelper.m
//  Calendar
//
//  Created by 魏威 on 16/4/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper
+(DateHelper*)shareDateHelper{
    static DateHelper * helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[DateHelper alloc]init];
       
    });
    return helper;
}

-(NSDate *)date{
    if (!_date) {
        self.date = [[NSDate alloc]init];
    }return _date;
}

#pragma mark - date

//天
- (NSInteger)day{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:_date];
    return [components day];
}

//月
- (NSInteger)month{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:_date];
    return [components month];
}
//年
- (NSInteger)year{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:_date];
    return [components year];
}

//本月第一个星期天
- (NSInteger)firstWeekdayInThisMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:_date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}
//本月的天数
- (NSInteger)totaldaysInThisMonth{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_date];
    return totaldaysInMonth.length;
}

- (NSInteger)totaldaysInMonth{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_date];
    return daysInLastMonth.length;
}
//上个月
- (NSDate *)lastMonth{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *lastDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:_date options:0];
    return lastDate;
}
//下个月
- (NSDate*)nextMonth{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:_date options:0];
    return newDate;
}




@end
