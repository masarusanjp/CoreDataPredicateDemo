//
//  CDPAlbumInitializeService.m
//  CoreDataPredicateDemo
//
//  Created by Masaru Ichikawa on 2014/04/06.
//  Copyright (c) 2014年 Masaru Ichikawa. All rights reserved.
//

#import "CDPAlbumInitializeService.h"
#import "Album.h"
#import "Song.h"

@interface CDPAlbumInitializeService ()

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation CDPAlbumInitializeService

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        self.managedObjectContext = context;
    }
    return self;
}

- (BOOL)setupIfNeededWithResouceName:(NSString *)resourceName {
    if ([self hasAnyAlbum]) {
        return NO;
    }
    else {
        return [self setupWithResourceName:resourceName];
    }
}

- (BOOL)hasAnyAlbum {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Album"];
    return [[_managedObjectContext executeFetchRequest:request error:NULL] count] > 0;
}

- (BOOL)setupWithResourceName:(NSString*)resourceName {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:resourceName ofType:nil];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:0 error:&error];
    if (error) {
        NSLog(@"%@", error);
        return NO;
    }
    for (NSDictionary *albumInfo in json) {
        [self addAlbumWithJSONDictionary:albumInfo];
    }
    NSError *coreDataError = nil;
    if (![_managedObjectContext save:&coreDataError]) {
        NSLog(@"%@", coreDataError);
        return NO;
    }
    
    return YES;
}

- (Album*)addAlbumWithJSONDictionary:(NSDictionary*)json {
    NSString *title = json[@"title"];
    NSString *artist = json[@"artist"];
    Album *album = (Album*)[NSEntityDescription insertNewObjectForEntityForName:@"Album"
                                                         inManagedObjectContext:_managedObjectContext];
    
    album.title = title;
    album.artist = artist;
    album.songs = [self songsWithJSONArray:json[@"songs"]];
    return album;
}

- (NSSet*)songsWithJSONArray:(NSArray*)songInfos {
    NSMutableSet *songs = [NSMutableSet set];
    for (NSDictionary *songInfo in songInfos) {
        Song *song = (Song*)[NSEntityDescription insertNewObjectForEntityForName:@"Song"
                                                          inManagedObjectContext:_managedObjectContext];
        
        song.name = songInfo[@"name"];
        song.duration = songInfo[@"duration"];
        song.artist = songInfo[@"artist"];
        song.composer = songInfo[@"composer"];
        song.rating = songInfo[@"rating"];
        NSNumber *playedAt = songInfo[@"playedAt"];
        if ([playedAt integerValue] != 0) {
            song.playedAt = [NSDate dateWithTimeIntervalSince1970:[playedAt unsignedIntegerValue]];
        }
        [songs addObject:song];
    }
    return songs;
}

@end