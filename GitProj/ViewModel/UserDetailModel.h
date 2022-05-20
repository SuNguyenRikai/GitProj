//
//  NSObject+UserDetailModel.h
//  GitProj
//
//  Created by HaDTT on 20/05/2022
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import "User.h"


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailModel : NSObject
@property User* user;
-(void)getUserDetailFrom:(NSString*) userName;
@end

NS_ASSUME_NONNULL_END
