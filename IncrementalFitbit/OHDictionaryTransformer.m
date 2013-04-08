//
//  OHDictionaryTransformer.m
//  IncrementalFitbit
//
//  Created by Oskar Hagberg on 2013-04-08.
//  Copyright (c) 2013 Oskar Hagberg. All rights reserved.
//

#import "OHDictionaryTransformer.h"

@implementation OHDictionaryTransformer

+ (void)initialize
{
    OHDictionaryTransformer* transformer = [[OHDictionaryTransformer alloc] init];
    [NSValueTransformer setValueTransformer:transformer forName:@"OHDictionaryTransformer"];
}

+ (Class)transformedValueClass
{
    return [NSData class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)reverseTransformedValue:(id)value
{
    if (value == nil) {
        return nil;
    }
    NSAssert([value isKindOfClass:[NSData class]], @"Object coming in to %@ transformedValue: should be of class NSData", self);
    NSData *data = value;
    NSDictionary* dictionary = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSAssert([dictionary isKindOfClass:[NSDictionary class]], @"Unarchived data should be of class NSDictionary", self);
    return dictionary;
}

- (id)transformedValue:(id)value
{
    if (value == nil) {
        return nil;
    }
    NSAssert([value isKindOfClass:[NSDictionary class]], @"Object coming in to %@ reverseTransformedValue: should be of class NSDictionary", self);
    NSDictionary *dictionary = value;
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:dictionary];
    return data;
}

@end
