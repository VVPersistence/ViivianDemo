//
//  WXView.h
//  五角星评分
//
//  Created by 魏威 on 16/6/11.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WXViewDelegate <NSObject>

-(void )Fenshu:(NSString*)xx;

@end








@interface WXView : UIView
@property (nonatomic,assign) id<WXViewDelegate>delegete;
@end
