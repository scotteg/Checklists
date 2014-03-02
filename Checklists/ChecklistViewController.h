//
//  ChecklistViewController.h
//  Checklists
//
//  Created by Scott Gardner on 2/27/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Checklist;

@interface ChecklistViewController : UITableViewController

@property (nonatomic, strong) Checklist *checklist;

@end
