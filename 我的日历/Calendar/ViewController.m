//
//  ViewController.m
//  Calendar
//
//  Created by 魏威 on 16/4/20.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "DateHelper.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UIButton *toDayButton;
@property (nonatomic,strong)DateHelper *dateHelper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //注册
    [self.collection registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    self.dateHelper = [DateHelper shareDateHelper];
    _dateHelper.today  = [NSDate date];
    _dateHelper.date =  _dateHelper.today;
    [self.monthLabel setText:[NSString stringWithFormat:@"%.2ld-%li",(long)[_dateHelper month],(long)[_dateHelper year]]];
    [self.toDayButton setTitle:[NSString stringWithFormat:@"%ld",[_dateHelper day]] forState:(UIControlStateNormal)];
    [self.collection reloadData];
    
}
#pragma mark ---- 集合视图
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  42;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
        //本月总天数
    NSInteger daysInThisMonth = [_dateHelper totaldaysInMonth];
    //本月第一个星期天
    NSInteger firstWeekday = [_dateHelper firstWeekdayInThisMonth];
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    if (i < firstWeekday) {
        [cell.gregorianLabel setText:@""];
        
    }else if (i > firstWeekday + daysInThisMonth - 1){
        [cell.gregorianLabel setText:@""];
    }else{
        day = i - firstWeekday + 1;
        [cell.gregorianLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
        //本月
        if ([_dateHelper.today isEqualToDate:_dateHelper.date]) {
            if (day == [_dateHelper day]) {
            } else if (day > [_dateHelper day]) {
            }
        } else if ([_dateHelper.today compare:_dateHelper.date] == NSOrderedAscending) {
            
        }
    }
    
    //安全处理
    cell.lunarLabel.text = @"";
    cell.lunarLabel.textColor = [UIColor blackColor];
    if (![cell.gregorianLabel.text isEqualToString:@""]) {
        if ((indexPath.row+1)%7 !=0 && (indexPath.row+1)%7 !=1) {
            cell.lunarLabel.text = @"工作";
        }else{
            cell.lunarLabel.text = @"休息";
            cell.lunarLabel.textColor = [UIColor redColor];
        }
    }
    
    
    
    return cell;
}
#pragma mark  ---集合视图约束
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/7, (self.collection.frame.size.height-12)/6);
}
// 设置每个cell上下左右相距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}
// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//上月
- (IBAction)lastMonthAction:(UIBarButtonItem *)sender {
    //赋值

    _dateHelper.date = [_dateHelper lastMonth];
    [self.monthLabel setText:[NSString stringWithFormat:@"%.2ld-%li",(long)[_dateHelper month],(long)[_dateHelper year]]];
    [self.collection reloadData];
}
//下月
- (IBAction)nextMonthAction:(UIBarButtonItem *)sender {
    //赋值

    _dateHelper.date = [_dateHelper nextMonth];
    [self.monthLabel setText:[NSString stringWithFormat:@"%.2ld-%li",(long)[_dateHelper month],(long)[_dateHelper year]]];
    [self.collection reloadData];
}
//返回今天的点击事件
- (IBAction)BackTodayAction:(UIButton *)sender {
    //赋值
     _dateHelper.date = _dateHelper.today;
     [self.monthLabel setText:[NSString stringWithFormat:@"%.2ld-%li",(long)[_dateHelper month],(long)[_dateHelper year]]];
    [self.collection reloadData];
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
