//
//  User.h
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//


@interface User : NSObject

@property NSString *avatarURL;
@property NSString *login;
@property NSString *siteAdmin;
@property NSString *bio;
@property NSString *location;
@property NSString *blog;
@property NSString *name;
@property int userID;
-(id)init: (NSString*) avatarURL login: (NSString*) login siteAdmin: (NSString*) siteAdmin bio: (NSString*) bio name: (NSString*) name location: (NSString*) location blog: (NSString*) blog uid: (int) uid;
@end
