//
//  OHFitbitClient.m
//  IncrementalFitbit
//
//  Created by Oskar Hagberg on 2013-04-08.
//  Copyright (c) 2013 Oskar Hagberg. All rights reserved.
//

#import "OHFitbitClient.h"

static NSString* const kOHFitbitClientAPIBaseURLString = @"http://api.fitbit.com/1";
static NSString* const kOHFitbitClientRequestTokenURLString = @"http://api.fitbit.com/oauth/request_token";
static NSString* const kOHFitbitClientAccessTokenURLString = @"http://api.fitbit.com/oauth/access_token";
static NSString* const kOHFitbitClientAuthorizeURLString = @"http://www.fitbit.com/oauth/authorize";

@implementation OHFitbitClient

+ (OHFitbitClient*)sharedFitbitClient
{
    static OHFitbitClient* _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] initWithBaseURL:[NSURL URLWithString:kOHFitbitClientAPIBaseURLString]];
    });
    return _shared;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (NSDictionary *)attributesForRepresentation:(NSDictionary *)representation
                                     ofEntity:(NSEntityDescription *)entity
                                 fromResponse:(NSHTTPURLResponse *)response
{
    NSMutableDictionary *mutablePropertyValues = [[super attributesForRepresentation:representation ofEntity:entity fromResponse:response] mutableCopy];
//    if ([entity.name isEqualToString:@"Artist"]) {
//        NSString *description = [representation valueForKey:@"description"];
//        [mutablePropertyValues setValue:description forKey:@"artistDescription"];
//    }
    
    return mutablePropertyValues;
}

- (BOOL)shouldFetchRemoteAttributeValuesForObjectWithID:(NSManagedObjectID *)objectID
                                 inManagedObjectContext:(NSManagedObjectContext *)context
{
    return NO;
    //return [[[objectID entity] name] isEqualToString:@"Artist"];
}

- (BOOL)shouldFetchRemoteValuesForRelationship:(NSRelationshipDescription *)relationship
                               forObjectWithID:(NSManagedObjectID *)objectID
                        inManagedObjectContext:(NSManagedObjectContext *)context
{
    return NO;
    //return [[[objectID entity] name] isEqualToString:@"Artist"];
}


@end
