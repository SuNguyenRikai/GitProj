//
//  UITableViewCell+CustomCell.m
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import "CustomCell.h"

#import <UIKit/UIKit.h>


@implementation  CustomCell : UITableViewCell

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.avatar.layer.borderWidth = 1;
    self.avatar.layer.masksToBounds = false;
    self.avatar.layer.borderColor = (__bridge CGColorRef _Nullable)(UIColor.blackColor);
    self.avatar.layer.cornerRadius = self.avatar.frame.size.height/2;
    self.avatar.clipsToBounds = true;
}

- (void) updateUI
{
    _siteAdmin.text = [NSString stringWithFormat:@"   %@   ",_siteAdmin.text];
     CGRect frame = _siteAdmin.frame;
    int newSize = _siteAdmin.intrinsicContentSize.width;
    frame.size.width = newSize;
     [_siteAdmin sizeToFit];
    
    _siteAdmin.backgroundColor = [UIColor colorWithRed:0.66 green:0.4 blue:0.79 alpha:1.00];
    _siteAdmin.layer.masksToBounds = false;
    _siteAdmin.layer.cornerRadius = _siteAdmin.frame.size.height/2;
    _siteAdmin.clipsToBounds = true;
}

@end
