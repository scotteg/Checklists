//
//  Checklist.h
//  Checklists
//
//  Created by Scott Gardner on 3/1/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *iconName;

- (int)countUncheckedItems;

@end
