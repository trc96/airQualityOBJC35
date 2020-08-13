//
//  TRCCityAirQualityController.h
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TRCCityAirQuality;

NS_ASSUME_NONNULL_BEGIN

@interface TRCCityAirQualityController : NSObject

+(void)fetchSupportedCountries:(void(^) (NSArray<NSString * > *_Nullable))completion;

+(void)fetchSupportedStatesInCountry:(NSString *)country
                          completion:(void (^) (NSArray<NSString * > *_Nullable))completion;

+(void)fetchSupportedCitiesInState:(NSString *)state
                           country:(NSString *)country
                        completion:(void (^) (NSArray<NSString * > *_Nullable))completion;

+(void)fetchDataForCity:(NSString *)city
                  state:(NSString *)state
                country:(NSString *)country
             completion:(void (^) (TRCCityAirQuality *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
