//
//  CDPDetailViewController.h
//  CoreDataPredicateDemo
//
//  Created by Masaru Ichikawa on 2014/04/05.
//  Copyright (c) 2014年 Masaru Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
