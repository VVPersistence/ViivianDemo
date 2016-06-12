//
//  MenuTableView.m
//  LianxiDemo
//
//  Created by 魏威 on 16/3/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "MenuTableView.h"

@implementation MenuTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if ([super initWithFrame:frame style:style]) {
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MenuTableView"];
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];

    cell.textLabel .text = [NSString stringWithFormat:@"%ld行",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"用通知" object:nil userInfo:nil];
   
    //点cell 置顶
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    NSLog(@"%ld",indexPath.row);
    
}

@end
