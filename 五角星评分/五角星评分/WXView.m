//
//  WXView.m
//  五角星评分
//
//  Created by 魏威 on 16/6/11.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "WXView.h"
#define kWidth  25
#define kHeight 50
#define kInterval 20
#define Ktag 650
@implementation WXView{
    UIView *testView;
    int count;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
        testView = [[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:testView];
        testView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//创建子视图
-(void)addSubViews{
    for (int i = 0; i<10; i++) {
        UIImageView *buttion = [[UIImageView alloc]init];
        buttion.tag = Ktag+i;
        if (i%2==0) {
            buttion.frame = CGRectMake( (i/2+1)*kInterval + i*kWidth, 0, kWidth, kHeight);
            buttion.backgroundColor = [UIColor yellowColor];
        }else{
         buttion.frame = CGRectMake(kInterval* (i+1)/2   +(i)*kWidth , 0, kWidth, kHeight);            buttion.backgroundColor = [UIColor redColor];
        }
        
        [self addSubview:buttion];
    }
    
    
}

//当有一个或多个手指触摸事件在当前视图或window窗体中响应
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:testView]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    int y = point.y;
    [self ss:x :y];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:testView]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    int y = point.y;
   // NSLog(@"touchMove (x, y) is (%d, %d)", x, y);
    [self ss:x :y];
    
}
-(void)ss:(int)x :(int)y{
   // NSLog(@"%d",y);
    if (y<self.bounds.size.height&&y>0) {
        if (x>kInterval&&x<kInterval+kWidth) {
            //NSLog(@"1");
            count = 1;
        }else if (x>kInterval+kWidth&&x<kInterval+2*kWidth){
           // NSLog(@"2");
            count = 2;

        }else if (x>2*kInterval+2*kWidth&&x<2*kInterval+3*kWidth){
           // NSLog(@"3");
            count = 3;
        }else if (x>2*kInterval+2*kWidth&&x<2*kInterval+4*kWidth){
           // NSLog(@"4");
            count = 4;

        }else if (x>3*kInterval+4*kWidth&&x<3*kInterval+5*kWidth){
          //  NSLog(@"5");
            count = 5;

            
        }else if (x>3*kInterval+5*kWidth&&x<3*kInterval+6*kWidth){
          //  NSLog(@"6");
            count = 6;

        }else if (x>4*kInterval+6*kWidth&&x<4*kInterval+7*kWidth){
           // NSLog(@"7");
            count = 7;

            
        }else if (x>4*kInterval+7*kWidth&&x<4*kInterval+8*kWidth){
           // NSLog(@"8");
            count = 8;

        }else if (x>5*kInterval+8*kWidth&&x<5*kInterval+9*kWidth){
           // NSLog(@"9");
            count = 9;

        }else if (x>5*kInterval+9*kWidth&&x<5*kInterval+10*kWidth){
           // NSLog(@"10");
            count = 10;

        }else{
            
        }
        [self chuangjian:count];
    }
    
}

-(void)chuangjian:(int)ii{
    //NSLog(@"%d",ii);
        for (int i = 0; i< 10; i++) {
        UIImageView * xxx = [self viewWithTag:Ktag+i];
        xxx.backgroundColor = [UIColor grayColor];
            xxx.image = nil;
        
    }
   

    for (int i = 0; i< ii; i++) {
        UIImageView * xxx = [self viewWithTag:Ktag+i];
        if (i%2==1) {
            xxx.image = [UIImage imageNamed:@"右"];
        }else{
            xxx.image = [UIImage imageNamed:@"左"];
        }
        xxx.backgroundColor = [UIColor blackColor];
        
    }
    
    if ([self.delegete respondsToSelector:@selector(Fenshu:)]) {
        [self.delegete Fenshu:[NSString stringWithFormat:@"%d",ii]];
        
    }

}

@end
