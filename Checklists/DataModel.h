//
//  DataModel.h
//  Checklists
//
//  Created by Scott Gardner on 3/2/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

+ (NSInteger)nextChecklistItemId;
- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(NSInteger)index;
- (void)sortChecklists;

@end
