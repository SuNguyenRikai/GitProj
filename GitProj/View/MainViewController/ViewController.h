//
//  ViewController.h
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
#import "CustomCell.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak) IBOutlet UITableView *listUser;

@end

