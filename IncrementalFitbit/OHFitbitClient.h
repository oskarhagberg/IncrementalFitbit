//
//  OHFitbitClient.h
//  IncrementalFitbit
//
//  Created by Oskar Hagberg on 2013-04-08.
//  Copyright (c) 2013 Oskar Hagberg. All rights reserved.
//

#import "AFRESTClient.h"
#import "AFIncrementalStore.h"

@interface OHFitbitClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (OHFitbitClient *)sharedFitbitClient;

@end
