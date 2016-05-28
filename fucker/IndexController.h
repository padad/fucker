//
//  IndexController.h
//  fucker
//
//  Created by 小咪 on 16/5/28.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *leftButton;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightButton;

- (IBAction)leftClick:(id)sender;

- (IBAction)rightButton:(id)sender;

@end
