//
//  MessageTableViewController.h
//  fucker
//
//  Created by 小咪 on 16/5/29.
//  Copyright © 2016年 tp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MessageValueBlock)(NSString *);

@interface MessageTableViewController : UITableViewController

@property (nonatomic,copy) NSString *textString;

@property (nonatomic,copy)MessageValueBlock messageValueBlock;




@end
