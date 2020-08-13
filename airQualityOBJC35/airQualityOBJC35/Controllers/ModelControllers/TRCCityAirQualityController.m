//
//  TRCCityAirQualityController.m
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "TRCCityAirQualityController.h"
#import "TRCCityAirQuality.h"

static NSString * const baseURLString = @"https://api.airvisual.com/";
static NSString * const versionComponent = @"v2";
static NSString * const countryComponent = @"countries";
static NSString * const stateComponent = @"states";
static NSString * const cityComponent = @"cities";
static NSString * const cityDetailsComponent = @"city";
static NSString * const apiKey = @"7310743d-bc2e-4cd8-9793-a47b325bb720";

@implementation TRCCityAirQualityController

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * countryURL = [versionURL URLByAppendingPathComponent:countryComponent];
    
    NSMutableArray<NSURLQueryItem * > * queryItems = [NSMutableArray new];
    
    NSURLQueryItem * apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:countryURL resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItems];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSDictionary * dataDictionary = topLevel[@"data"];
            NSMutableArray * countries = [NSMutableArray new];
            for (NSDictionary * countryDictionary in dataDictionary)
            {
                NSString * country = [[NSString alloc] initWithString:countryDictionary[@"country"]];
                [countries addObject:country];
            }
            completion(countries);
        }
    }] resume];
}

+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * statesURL = [versionURL URLByAppendingPathComponent:stateComponent];
    
    NSMutableArray<NSURLQueryItem * > * queryItems = [NSMutableArray new];
    
    NSURLQueryItem * countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:countryQuery];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:statesURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSDictionary * dataDictionary = topLevel[@"data"];
            NSMutableArray * states = [NSMutableArray new];
            for (NSDictionary * stateDictionary in dataDictionary)
            {
                NSString * state = [[NSString alloc] initWithString:stateDictionary[@"state"]];
                [states addObject:state];
            }
            completion(states);
        }
        
    }] resume];
}

+ (void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * citiesURL = [versionURL URLByAppendingPathComponent:cityComponent];
    
    NSMutableArray<NSURLQueryItem * > * queryItems = [NSMutableArray new];
    
    NSURLQueryItem * stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem * countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:stateQuery];
    [queryItems addObject:countryQuery];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:citiesURL resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItems];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSDictionary * dataDictionary = topLevel[@"data"];
            NSMutableArray * cities = [NSMutableArray new];
            for (NSDictionary * cityDictionary in dataDictionary)
            {
                NSString * city = [[NSString alloc] initWithString:cityDictionary[@"city"]];
                [cities addObject:city];
            }
            completion(cities);
        }
        
    }] resume];
}

+ (void)fetchDataForCity:(NSString *)city state:(NSString *)state country:(NSString *)country completion:(void (^)(TRCCityAirQuality * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * cityURL = [versionURL URLByAppendingPathComponent:cityDetailsComponent];
    
    NSMutableArray<NSURLQueryItem * > * queryItems = [NSMutableArray new];
    
    NSURLQueryItem * cityQuery = [[NSURLQueryItem alloc] initWithName:@"city" value:city];
    NSURLQueryItem * stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem * countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:cityQuery];
    [queryItems addObject:stateQuery];
    [queryItems addObject:countryQuery];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:cityURL resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItems];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSDictionary * dataDictionary = topLevel[@"data"];
            
            TRCCityAirQuality * cityAQI = [[TRCCityAirQuality alloc] initWithDictionary:dataDictionary];
            completion(cityAQI);
        }
        
    }] resume];
}
@end
