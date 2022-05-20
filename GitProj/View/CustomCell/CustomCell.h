//
//  UITableViewCell+CustomCell.h
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface  CustomCell: UITableViewCell
@property (weak) IBOutlet UIImageView *avatar;
@property (weak) IBOutlet UILabel *name;
@property (weak) IBOutlet UILabel *siteAdmin;
- (void) updateUI;
@end

NS_ASSUME_NONNULL_END
