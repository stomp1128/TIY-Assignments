//
//  Movie.h
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

+ (Movie *)movieWithDictionary:(NSDictionary *)movieDictionary;


@property (nonatomic) NSString *title;
@property (nonatomic) NSString *year;
@property (nonatomic) NSString *rated;
@property (nonatomic) NSString *released;
@property (nonatomic) NSString *runtime;
@property (nonatomic) NSString *genre;
@property (nonatomic) NSString *director;
@property (nonatomic) NSString *actors;
@property (nonatomic) NSString *plot;
@property (nonatomic) NSString *posterString;
@property (nonatomic) NSString *imdbRating;
@property (nonatomic) NSData *posterImageData;



@end
