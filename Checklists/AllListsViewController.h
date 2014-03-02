//
//  AllListsViewController.h
//  Checklists
//
//  Created by Scott Gardner on 3/1/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataModel;

@interface AllListsViewController : UITableViewController

@property (nonatomic, strong) DataModel *dataModel;

@end
