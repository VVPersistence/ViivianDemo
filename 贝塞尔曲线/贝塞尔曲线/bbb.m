//
//  bbb.m
//  贝塞尔曲线
//
//  Created by 席亚坤 on 16/5/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "bbb.h"

@implementation bbb

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
  UIColor*  aColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    //以10为半径围绕圆心画指定角度扇形
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddArc(context, 180, 180, 200,  60 * PI / 180, 120 * PI / 180, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径

 
}
@end
