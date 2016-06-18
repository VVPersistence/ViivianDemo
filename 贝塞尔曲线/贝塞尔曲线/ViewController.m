//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by 席亚坤 on 16/5/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "BSView.h"
#import "bbb.h"
@interface ViewController (){
    BSView *BSview;
    bbb *bb;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BSview = [[BSView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //[self.view addSubview:BSview];
    bb = [[bbb alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bb.backgroundColor = [UIColor redColor];
    [self.view addSubview:bb];
    
  UIBezierPath * path =  [UIBezierPath  bezierPathWithArcCenter:self.view.center radius:40 startAngle:0 endAngle:60 clockwise:YES];
   // CGAffineTransform  transform = CGAffineTransformMake(0, 0, 0, 0, 0, 0);
   // CATransform3D
      // CALayer *layer = [[CALayer alloc]init];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    //view.transform = transform;
    [path applyTransform:view. transform];
    [path fill];

    //[self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
