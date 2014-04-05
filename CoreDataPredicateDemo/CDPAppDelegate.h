//
//  CDPAppDelegate.h
//  CoreDataPredicateDemo
//
//  Created by Masaru Ichikawa on 2014/04/05.
//  Copyright (c) 2014年 Masaru Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
