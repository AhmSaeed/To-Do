//
//  ToDo.h
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject{
    NSString *name;
    NSString *details;
    int priority;
    int status;
}

@property int priority, status;
@property NSString *name, *details;

- (void) printToDo;

@end
