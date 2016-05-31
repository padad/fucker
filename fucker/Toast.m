//
//  Utils.m
//  fucker
//
//  Created by 小咪 on 16/5/28.
//  Copyright © 2016年 tp. All rights reserved.
//

#import "Toast.h"


@implementation Toast

-(void)showTips:(UIView *)mthis :(NSString *)msg{
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tips" message:msg delegate:mthis cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//    
//    [alert show];
    
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:mthis];
    [mthis addSubview:HUD];
    HUD.labelText = msg;
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Checkmark"]];
    
    HUD.yOffset = 250.0f;
    
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    }completionBlock:^{
        [HUD removeFromSuperview];
        
        
    }];
    
}




- (void) showProgressDialog:(UIView *)mthis
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:mthis];
    [mthis addSubview:HUD];
    
    HUD.labelText = @"正在加载";
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    //HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Checkmark"]];
    
    
    
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        
       float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            HUD.progress = progress;
            usleep(50000);
        }
    }completionBlock:^{
        [HUD removeFromSuperview];
        
        
    }];
    
    
    
}

@end
