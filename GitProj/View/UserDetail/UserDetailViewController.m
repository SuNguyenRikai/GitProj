//
//  ViewController+UserDetail.m
//  GitProj
//
//  Created by HaDTT on 20/05/2022
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import "UserDetailViewController.h"

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>


@implementation UserDetailViewController : UIViewController


-(void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUserDetail) name:@"UserDetailChanged" object:nil];
    self.avatar.layer.borderWidth = 1;
    self.avatar.layer.masksToBounds = false;
    self.avatar.layer.borderColor = (__bridge CGColorRef _Nullable)(UIColor.blackColor);
    self.avatar.layer.cornerRadius = self.avatar.frame.size.height/2;
    self.avatar.clipsToBounds = true;
    self.model = [[UserDetailModel alloc] init];
    _model = [[UserDetailModel alloc] init];
    [_model getUserDetailFrom:_userName];
}

- (void) updateUserDetail
{
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:[self.model.user avatarURL]]];
    self.blogLink.text = [self.model.user blog];
    self.location.text = [self.model.user location];
    self.login.text = [self.model.user login];
    self.name.text = [self.model.user name];
    self.siteAdmin.text = [self.model.user siteAdmin];
    _siteAdmin.text = [NSString stringWithFormat:@"   %@   ",_siteAdmin.text];
    CGRect frame = _siteAdmin.frame;
    int newSize = _siteAdmin.intrinsicContentSize.width;
    frame.size.width = newSize;
    [_siteAdmin setFrame:frame];
    _siteAdmin.backgroundColor = [UIColor colorWithRed:0.66 green:0.4 blue:0.79 alpha:1.00];
    _siteAdmin.layer.masksToBounds = false;
    _siteAdmin.layer.cornerRadius = _siteAdmin.frame.size.height/2;
    _siteAdmin.clipsToBounds = true;
    self.bio.text = [self.model.user bio];
}

- (IBAction)closeView:(id)sender {
    NSLog(@"close detail view");
    [self dismissViewControllerAnimated:TRUE completion:nil];
}



@end
