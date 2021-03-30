//
//  AddToDoViewController.h
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Enums.h"
#import "AddToDo.h"
#import "ToDo.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddToDoViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameToDoTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailsToDoTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *statusPickerView;
- (IBAction)onAddToDoClick:(UIButton *)sender;

@property id<AddToDo> viewController;

@end

NS_ASSUME_NONNULL_END
