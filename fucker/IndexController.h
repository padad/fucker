//
//  IndexController.h
//  fucker
//
//  Created by 小咪 on 16/5/28.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexController : BaseViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *leftButton;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightButton;

- (IBAction)leftClick:(id)sender;

- (IBAction)rightClick:(id)sender;

@end
