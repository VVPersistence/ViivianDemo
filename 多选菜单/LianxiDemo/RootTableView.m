//
//  RootTableView.m
//  LianxiDemo
//
//  Created by 魏威 on 16/3/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "RootTableView.h"

@implementation RootTableView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]) {
        self.delegate = self;
        self.dataSource = self;
        [[NSNotificationCenter defaultCenter]addObserver : self selector:@selector(reloadViewOfSelf:) name:@"用通知"  object:nil];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootTableView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    NSInteger count = arc4random()%40;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld" ,count];
    
    return cell;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewCell *header = [tableView dequeueReusableCellWithIdentifier:@"RootTableView1"];
    header.textLabel.text = @"页眉";
    return  header;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    NSLog(@"=====");
}
-(void)reloadViewOfSelf:(NSNotification *)notification{
  //  NSLog(@"34");
    [self reloadData];

}

@end
