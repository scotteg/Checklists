//
//  Checklist.m
//  Checklists
//
//  Created by Scott Gardner on 3/1/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import "Checklist.h"
#import "ChecklistItem.h"

@implementation Checklist

- (id)init
{
    if (self = [super init]) {
        self.items = [NSMutableArray arrayWithCapacity:20];
        self.iconName = @"No Icon";
    }
    
    return self;
}

- (int)countUncheckedItems
{
    int count = 0;
    
    for (ChecklistItem *item in self.items) {
        if (!item.checked) {
            count += 1;
        }
    }
    
    return count;
}

- (NSComparisonResult)compare:(Checklist *)otherChecklist
{
    return [self.name localizedStandardCompare:otherChecklist.name];
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
        self.iconName = [aDecoder decodeObjectForKey:@"IconName"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
    [aCoder encodeObject:self.iconName forKey:@"IconName"];
}

@end
