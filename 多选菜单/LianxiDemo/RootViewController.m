//
//  RootViewController.m
//  LianxiDemo
//
//  Created by 魏威 on 16/3/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "RootViewController.h"
#import "MenuTableView.h"
#import "RootTableView.h"
@interface RootViewController ()
@property (nonatomic,strong)MenuTableView *menuTableView;
@property (nonatomic,strong)RootTableView *rootTableView;
@end

@implementation RootViewController
-(void)loadView{
    [super loadView];
    self.menuTableView = [[MenuTableView alloc]initWithFrame:CGRectMake(0, 0, 100, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
    [self.view addSubview:_menuTableView];
   // self.rootTableView = [[RootTableView alloc]init];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  self.menuTableView = [[MenuTableView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
