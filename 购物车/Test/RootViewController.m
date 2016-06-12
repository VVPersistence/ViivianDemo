//
//  RootViewController.m
//  Test
//
//  Created by 魏威 on 16/4/8.
//  Copyright © 2016年 魏威. All rights reserved.
//

#import "RootViewController.h"
#import "TableViewController.h"

@interface RootViewController ()<TableViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *mainlabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//点击事件
- (IBAction)pushToAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"push" sender:sender];
}
-(void)valueOfCell:(NSMutableArray*)array{
    NSMutableString *mutableStr = [NSMutableString string];
    for (NSString *str in array) {
        mutableStr = (NSMutableString*) [mutableStr stringByAppendingString:str];
        
    }
    self.mainlabel.text = mutableStr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"push"]) {
        TableViewController  *VC= [segue destinationViewController];
        VC.delegate = self;
    }
}


@end
