//
//  TableViewController.h
//  Test
//
//  Created by 魏威 on 16/4/8.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TableViewControllerDelegate <NSObject>

-(void)valueOfCell:(NSMutableArray*)array;

@end



@interface TableViewController : UITableViewController
@property (nonatomic,assign)id<TableViewControllerDelegate>delegate;
@end
