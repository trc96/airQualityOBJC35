//
//  TRCPollution.h
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRCPollution : NSObject

@property (nonatomic, readonly)NSInteger airQualityIndex;

-(instancetype)initWithAQI:(NSInteger)airQualityIndex;

@end

@interface TRCPollution (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
