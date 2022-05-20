//
//  User.m
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User : NSObject

-(id)init: (NSString*) avatarURL login: (NSString*) login siteAdmin: (NSString*) siteAdmin bio: (NSString*) bio name: (NSString*) name location: (NSString*) location blog: (NSString*) blog uid: (int) uid
{
    self = [super init];
    if (self) {
        self.avatarURL = avatarURL;
        self.siteAdmin = siteAdmin;
        self.login = login;
        self.bio = bio;
        self.name = name;
        self.location = location;
        self.blog = blog;
        self.userID = uid;
    }
    return self;
}

@end
