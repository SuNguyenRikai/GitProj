//
//  NSObject+Networking.m
//  GitProj
//
//  Created by HaDTT on 20/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import "Networking.h"
#import <AFNetworking/AFNetworking.h>
#import "User.h"

@interface Networking ()

@property int numOfPage;

@end

@implementation  Networking : NSObject
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numOfPage = 20;
    }
    return self;
}

-(void)requestUsersFrom:(NSInteger)startID callback:(void (^)(NSArray *listUser))completion {
    NSString *URLString = @"https://api.github.com/users";
    NSDictionary *parameters = @{@"since": [NSNumber numberWithInteger:startID], @"per_page": [NSNumber numberWithInteger:_numOfPage]};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:parameters headers:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSMutableArray *data = [[NSMutableArray alloc] init];
        for (NSDictionary *u in responseObject) {
            User *user = [[User alloc] init:[u valueForKey:@"avatar_url"] login:[u valueForKey:@"login"] siteAdmin:[u valueForKey:@"type"] bio:[u valueForKey:@"bio"] name:[u valueForKey:@"name"] location:[u valueForKey:@"location"] blog:[u valueForKey:@"blog"] uid: [[u valueForKey:@"id"] intValue]];
            [data addObject:user];
        }
        completion(data);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

-(void)requestUserDetailFrom:(NSString *)userName callback:(void (^)(User * _Nonnull))completion
{
    NSString *URLString =  [NSString stringWithFormat:@"https://api.github.com/users/%@", userName];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:URLString parameters:nil headers:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            User *data = [[User alloc] init];
            data.avatarURL = [[responseObject valueForKey:@"avatar_url"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"avatar_url"] : @"";
            data.login = [[responseObject valueForKey:@"login"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"login"] : @"";
            data.siteAdmin = [[responseObject valueForKey:@"type"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"type"] : @"";
            data.bio = [[responseObject valueForKey:@"bio"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"bio"] : @"";
            data.name = [[responseObject valueForKey:@"name"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"name"] : @"";
            data.location = [[responseObject valueForKey:@"location"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"location"]  : @"";
            data.blog = [[responseObject valueForKey:@"blog"] isKindOfClass:[NSString class]] ? [responseObject valueForKey:@"blog"] : @"";
            completion(data);
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
}

- (BOOL) checkDataValue: (id) object
{
    BOOL res = [object isKindOfClass:[NSString class]];
    return res;
}

@end
