//
//  ToDoDetailsViewController.h
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "UpdateToDo.h"

@interface ToDoDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameTodoTextView;
@property (weak, nonatomic) IBOutlet UILabel *detailsTodoTextView;
@property (weak, nonatomic) IBOutlet UILabel *priority;
@property ToDo *todo;

@property id<UpdateToDo> viewController;

@end
