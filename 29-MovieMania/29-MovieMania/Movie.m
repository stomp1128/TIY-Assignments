//
//  Movie.m
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Movie.h"

@implementation Movie


+ (Movie *)movieWithDictionary:(NSDictionary *)movieDictionary
{
    Movie *Movie = nil;
   
    {
        
        Movie.title = [movieDictionary objectForKey:@"Title"];
        Movie.year = [movieDictionary objectForKey:@"Year"];
        Movie.rated = [movieDictionary objectForKey:@"Rated"];
        Movie.runtime = [movieDictionary objectForKey:@"Runtime"];
        Movie.genre = [movieDictionary objectForKey:@"Genre"];
        Movie.director = [movieDictionary objectForKey:@"Director"];
        Movie.actors = [movieDictionary objectForKey:@"Actors"];
        Movie.plot = [movieDictionary objectForKey:@"Plot"];
        Movie.posterString = [movieDictionary objectForKey:@"Poster"];
        Movie.imdbRating = [movieDictionary objectForKey:@"imdbRating"];
        Movie.genre = [movieDictionary objectForKey:@"Genre"];
        
        
    }
    
    return Movie;
}

@end
