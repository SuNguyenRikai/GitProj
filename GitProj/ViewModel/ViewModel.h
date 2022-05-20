//
//  ViewModel.h
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//
#import "ListUsers.h"
@interface ViewModel : NSObject

@property ListUsers* data;
-(void)getUserDataFrom:(int) startID;
@end
