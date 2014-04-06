//
//  CDPAlbumInitializeService.h
//  CoreDataPredicateDemo
//
//  Created by Masaru Ichikawa on 2014/04/06.
//  Copyright (c) 2014年 Masaru Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDPAlbumInitializeService : NSObject

- (id)initWithManagedObjectContext:(NSManagedObjectContext*)context;
- (BOOL)setupIfNeededWithResouceName:(NSString*)resourceName;

@end
