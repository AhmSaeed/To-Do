//
//  ToDoDetailsViewController.m
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import "ToDoDetailsViewController.h"
#import "EditTodoViewController.h"

@interface ToDoDetailsViewController ()

@end

@implementation ToDoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameTodoTextView.text = _todo.name;
    _detailsTodoTextView.text = _todo.details;
    switch(_todo.priority){
        case 0:
            _priority.text = @"High";
            break;
        case 1:
            _priority.text = @"Medium";
            break;
        case 2:
            _priority.text = @"Low";
            break;
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EditTodoViewController *editDetailsVC = segue.destinationViewController;
    
    editDetailsVC.todo = _todo;
    
    editDetailsVC.viewController = _viewController;
}

@end
