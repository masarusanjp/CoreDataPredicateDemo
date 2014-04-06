//
//  Song.h
//  CoreDataPredicateDemo
//
//  Created by Masaru Ichikawa on 2014/04/06.
//  Copyright (c) 2014年 Masaru Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Song : NSManagedObject

@property (nonatomic, retain) NSString * artist;
@property (nonatomic, retain) NSString * composer;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * playedAt;
@property (nonatomic, retain) Album *album;

@end
    