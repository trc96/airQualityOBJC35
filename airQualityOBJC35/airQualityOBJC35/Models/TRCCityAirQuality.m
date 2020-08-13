//
//  TRCCityAirQuality.m
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "TRCCityAirQuality.h"
#import "TRCWeather.h"
#import "TRCPollution.h"

@implementation TRCCityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(TRCWeather *)weather pollution:(TRCPollution *)pollution
{
    self = [super init];
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation TRCCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * city = dictionary[@"city"];
    NSString * state = dictionary[@"state"];
    NSString * country = dictionary[@"country"];
    NSDictionary * currentInfo = dictionary[@"current"];
    TRCWeather * weather = [[TRCWeather alloc] initWithDictionary:currentInfo[@"weather"]];
    TRCPollution * pollution = [[TRCPollution alloc] initWithDictionary:currentInfo[@"pollution"]];
    return [self initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
