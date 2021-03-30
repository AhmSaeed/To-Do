//
//  ToDo.m
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

@synthesize name, details, priority, status;

- (void) printToDo{
    printf("\nName: %s", [(NSString *)name UTF8String]);
    printf("\nDetails: %s", [(NSString *)details UTF8String]);
    printf("\nPriority: %ld", (long)priority);
    printf("\nStatus: %ld", (long)status);
}

@end
