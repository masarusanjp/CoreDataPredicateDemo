//
//  CDPMasterViewController.h
//  CoreDataPredicateDemo
//
//  Created by Masaru Ichikawa on 2014/04/05.
//  Copyright (c) 2014年 Masaru Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface CDPMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
