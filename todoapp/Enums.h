//
//  Enums.h
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import <Foundation/Foundation.h>

enum Priority{
   low = 0,
   medium = 1,
   height = 2
};

@interface Enums : NSObject

@property enum Priority priority;
@end
