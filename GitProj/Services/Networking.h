//
//  NSObject+Networking.h
//  GitProj
//
//  Created by HaDTT on 20/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Networking : NSObject

@property NSString *url;
-(void)requestUsersFrom:(NSInteger)startID callback:(void (^)(NSArray *listUser))completion;
-(void)requestUserDetailFrom:(NSString*)userName callback:(void (^)(User *user))completion;

@end

NS_ASSUME_NONNULL_END
