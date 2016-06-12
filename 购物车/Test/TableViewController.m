//
//  TableViewController.m
//  Test
//
//  Created by 魏威 on 16/4/8.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
@interface TableViewController ()
@property(nonatomic,strong)NSMutableArray* dataArray;
@property (nonatomic,strong)NSMutableArray* valueArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    self.valueArray= [NSMutableArray array];
    self.dataArray = [NSMutableArray arrayWithObjects: @"1.png", @"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",nil] ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    
    NSString *imageName = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    cell.cellImage.image  = [UIImage imageNamed:imageName];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //得到cell
    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ( [self.dataArray[indexPath.row] isEqualToString:@"1.png"]) {
        cell.cellImage.image = [UIImage imageNamed:@"2.png"];
        self.dataArray[indexPath.row] = @"2.png" ;
        //判断一下
        [self.valueArray   addObject:[NSString stringWithFormat:@"%ld行,",indexPath.row]];
        
    }else{
        //创建字符串
        NSString *arrayStr = @"";
        for (NSMutableString *str in self.valueArray) {
            if ([[NSString stringWithFormat: @"%ld行,",(long)indexPath.row] isEqualToString: str]) {
                
                arrayStr = str;
            }
        }
        //删除
        [self.valueArray removeObject:arrayStr];
        cell.cellImage.image = [UIImage imageNamed:@"1.png"];
        self.dataArray[indexPath.row] = @"1.png" ;
        
    }
    NSLog(@"%@",self.valueArray);
    
    
}
//属性传值

-(void)viewWillDisappear:(BOOL)animated{
    if ([self.delegate respondsToSelector:@selector(valueOfCell:)]) {
        
        [self.delegate valueOfCell:self.valueArray];
    }
    
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
