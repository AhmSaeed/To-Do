//
//  ViewController.h
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AddToDo.h"
#import "UpdateToDo.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, AddToDo, UpdateToDo>

@property (weak, nonatomic) IBOutlet UITableView *toDoTableView;
- (IBAction)onSegmentedTabClick:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (void) initPList;

@end

