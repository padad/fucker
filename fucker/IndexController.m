//
//  IndexController.m
//  fucker
//
//  Created by 小咪 on 16/5/28.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "IndexController.h"

@interface IndexController ()

@end

@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.leftButton.title = @"我靠";
    
    
//    if ([[[UIDevice currentDevice] systemVersion] doubleValue] > 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    // Do any additional setup after loading the view.
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


- (IBAction)leftClick:(id)sender {
    [Toast showTips:self.view :@"left"];
}

- (IBAction)rightButton:(id)sender {
    
    [Toast showTips:self.view :@"right"];
    
}
@end
