//
//  DataModel.m
//  Checklists
//
//  Created by Scott Gardner on 3/2/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import "DataModel.h"
#import "Checklist.h"

@implementation DataModel

+ (NSInteger)nextChecklistItemId
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger itemId = [userDefaults integerForKey:@"ChecklistItemId"];
    [userDefaults setInteger:itemId + 1 forKey:@"ChecklistItemId"];
    [userDefaults synchronize];
    return itemId;
}

- (void)registerDefaults
{
    NSDictionary *dictionary = @{
                                 @"ChecklistIndex" : @-1,
                                 @"FirstTime" : @YES,
                                 @"ChecklistItemId" : @0,
                                 };
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

- (id)init
{
    if ((self = [super init])) {
        [self loadChecklists];
        [self registerDefaults];
        [self handleFirstTime];
    }
    
    return self;
}

- (void)handleFirstTime
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL firstTime = [userDefaults boolForKey:@"FirstTime"];
    
    if (firstTime) {
        Checklist *checklist = [Checklist new];
        checklist.name = @"List";
        [self.lists addObject:checklist];
        [self setIndexOfSelectedChecklist:0];
        [userDefaults setBool:NO forKey:@"FirstTime"];
    }
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"Checklists.plist"];
}

- (void)saveChecklists
{
    NSMutableData *data = [NSMutableData new];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.lists forKey:@"Checklists"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadChecklists
{
    NSString *path = [self dataFilePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.lists = [unarchiver decodeObjectForKey:@"Checklists"];
        [unarchiver finishDecoding];
    } else {
        self.lists = [NSMutableArray arrayWithCapacity:20];
    }
}

- (NSInteger)indexOfSelectedChecklist
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"ChecklistIndex"];
}

- (void)setIndexOfSelectedChecklist:(NSInteger)index
{
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"ChecklistIndex"];
}

- (void)sortChecklists
{
    [self.lists sortUsingSelector:@selector(compare:)];
}

@end
