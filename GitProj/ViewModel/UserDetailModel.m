//
//  NSObject+UserDetailModel.m
//  GitProj
//
//  Created by HaDTT on 20/05/2022
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDetailModel.h"
#import "Networking.h"

@implementation UserDetailModel : NSObject

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)getUserDetailFrom:(NSString *)userName
{
    Networking *network = [[Networking alloc] init];
    [network requestUserDetailFrom:userName callback:^(User * _Nonnull user) {
        self.user = user;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDetailChanged" object:nil];
    }];
}
    
@end
