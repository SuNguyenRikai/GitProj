//
//  ViewModel.m
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModel.h"
#import "Networking.h"

@implementation ViewModel : NSObject

-(id)init
{
    self = [super init];
    if (self) {
        self.data = [[ListUsers alloc] init];
    }
    return self;
}

-(void)getUserDataFrom:(int) startID {
    Networking *network = [[Networking alloc] init];
    [network requestUsersFrom:startID callback:^(NSArray * _Nonnull listUser) {
        self.data.listUsers = listUser;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserListChanged" object:nil];
    }];
}

@end
