//
//  Movie.m
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (Movie *)movieWithDictionary:(NSDictionary *)movieDictionary

{
    Movie *aMovie;
    
    {
        aMovie = [[Movie alloc] init];
        aMovie.title = [movieDictionary objectForKey:@"Title"];
        aMovie.year = [movieDictionary objectForKey:@"Year"];
        aMovie.rated = [movieDictionary objectForKey:@"Rated"];
        aMovie.released = [movieDictionary objectForKey:@"Released"];
        aMovie.runtime = [movieDictionary objectForKey:@"Runtime"];
        aMovie.genre = [movieDictionary objectForKey:@"Genre"];
        aMovie.director = [movieDictionary objectForKey:@"Director"];
        aMovie.actors = [movieDictionary objectForKey:@"Actors"];
        aMovie.plot = [movieDictionary objectForKey:@"Plot"];
        aMovie.posterString = [movieDictionary objectForKey:@"Poster"];
        aMovie.imdbRating = [movieDictionary objectForKey:@"imdbRating"];
        
    }
    
    return aMovie;
}


@end
