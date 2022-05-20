//
//  ViewController+UserDetail.h
//  GitProj
//
//  Created by HaDTT on 20/05/2022
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ViewController.h"
#import "User.h"
#import "UserDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailViewController : UIViewController

@property (weak) IBOutlet UIImageView *avatar;
@property (weak) IBOutlet UILabel *name;
@property (weak) IBOutlet UILabel *location;
@property (weak) IBOutlet UILabel *blogLink;
@property (weak) IBOutlet UILabel *login;
@property (weak) IBOutlet UILabel *siteAdmin;
@property (weak) IBOutlet UILabel *bio;
@property UserDetailModel *model;
@property NSString *userName;

@end

NS_ASSUME_NONNULL_END
