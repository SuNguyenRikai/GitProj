//
//  ListUsers.m
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListUsers.h"

@implementation ListUsers

-(id)init: (NSMutableArray*) listUsers
{
    self = [super init];
    if (self) {
        self.listUsers = listUsers;
    }
    return self;
}

@end
