//
//  MenuTableView.h
//  LianxiDemo
//
//  Created by 魏威 on 16/3/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuTableViewDelegate <NSObject>

-(void)reloadViewForSelf;

@end



@interface MenuTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign)id<MenuTableViewDelegate>MenuDelegate;

@end
