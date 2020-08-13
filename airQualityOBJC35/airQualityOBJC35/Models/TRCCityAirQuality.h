//
//  TRCCityAirQuality.h
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRCWeather;
@class TRCPollution;

NS_ASSUME_NONNULL_BEGIN

@interface TRCCityAirQuality : NSObject

@property (nonatomic, copy, readonly)NSString * city;
@property (nonatomic, copy, readonly)NSString * state;
@property (nonatomic, copy, readonly)NSString * country;
@property (nonatomic, copy, readonly)TRCWeather * weather;
@property (nonatomic, copy, readonly)TRCPollution * pollution;

-(instancetype)initWithCity:(NSString *)city
                      state:(NSString *)state
                    country:(NSString *)country
                    weather:(TRCWeather *)weather
                  pollution:(TRCPollution *)pollution;

@end

@interface TRCCityAirQuality (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
