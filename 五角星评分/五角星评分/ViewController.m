//
//  ViewController.m
//  五角星评分
//
//  Created by 魏威 on 16/6/11.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "ViewController.h"
#import "WXView.h"
@interface ViewController ()<WXViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WXView * WX = [[WXView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    WX.delegete = self;
    [self.view addSubview:WX];
   
}
-(void)Fenshu:(NSString *)xx{
    NSLog(@"%@",xx);
    self.label.text = [NSString stringWithFormat:@"%@分",xx];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
