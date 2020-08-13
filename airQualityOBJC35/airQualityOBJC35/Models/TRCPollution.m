//
//  TRCPollution.m
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "TRCPollution.h"

@implementation TRCPollution

- (instancetype)initWithAQI:(NSInteger)airQualityIndex
{
    self = [super init];
    if (self)
    {
        _airQualityIndex = airQualityIndex;
    }
    return self;
}

@end

@implementation TRCPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger airQualityIndex = [dictionary[@"aquis"] intValue];
    
    return [self initWithAQI:airQualityIndex];
}

@end
