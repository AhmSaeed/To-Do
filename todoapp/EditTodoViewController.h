//
//  EditTodoViewController.h
//  todoapp
//
//  Created by Ahmed Morsy on 3/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UpdateToDo.h"

@interface EditTodoViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameToDoTextView;
@property (weak, nonatomic) IBOutlet UITextField *detailsToDoTextView;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *statusPickerView;
- (IBAction)onSaveChangesClick:(UIButton *)sender;

@property ToDo *todo;
@property id<UpdateToDo> viewController;

@end
