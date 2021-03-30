//
//  EditTodoViewController.m
//  todoapp
//
//  Created by Ahmed Morsy on 3/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//
#import "EditTodoViewController.h"
#import "ToDo.h"

@interface EditTodoViewController ()

@property NSArray *prioriy;
@property NSArray *status;
@property NSMutableArray *toDoList;
@property int priorityResult;
@property int statusResult;
@end

@implementation EditTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameToDoTextView.text = _todo.name;
    _detailsToDoTextView.text = _todo.details;
    [_priorityPickerView selectRow: _todo.priority inComponent: 0 animated:true];
    [_statusPickerView selectRow: _todo.status inComponent: 0 animated:true];
    
    _toDoList = [NSMutableArray new];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"todo" ofType:@"plist"];
    
    [_toDoList writeToFile:path atomically:YES];
    
    _toDoList = [[NSMutableArray alloc] initWithContentsOfFile: path];
    
    _prioriy = @[@"High", @"Medium", @"Low"];
    _status = @[@"ToDo", @"InProgress", @"Done"];
    
    _priorityPickerView.delegate = self;
    _priorityPickerView.dataSource = self;
    _statusPickerView.delegate = self;
    _statusPickerView.dataSource = self;
}

- (IBAction)onSaveChangesClick:(UIButton *)sender {
    ToDo *todo = [ToDo new];
    todo.name = _nameToDoTextView.text;
    todo.details = _detailsToDoTextView.text;
    todo.priority = _priorityResult;
    todo.status = _statusResult;
    
    [_viewController updateTodo: todo];
    [self.navigationController popViewControllerAnimated: YES];
    [self.navigationController popViewControllerAnimated: YES];
}

//#pragma mark - Navigation
//
//// In a storyboard-based application, you will [often] want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}

#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger result;
    
    if(pickerView.tag == 0){
        result = _prioriy.count;
    } else {
        result = _status.count;
    }
    return result;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * result = nil;
    
    if(pickerView.tag == 0){
        result = _prioriy[row];
    } else {
        result = _status[row];
    }
    
    return result;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView.tag == 0){
        self.priorityResult = (int)row;
    } else {
        self.statusResult = (int)row;
    }
}

@end
