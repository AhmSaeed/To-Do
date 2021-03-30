//
//  ViewController.m
//  todoapp
//
//  Created by Ahmed Morsy on 3/29/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

#import "ViewController.h"
#import "AddToDoViewController.h"
#import "ToDoDetailsViewController.h"
#import "ToDo.h"

@interface ViewController ()

@property NSMutableArray *mainToDoList;

@property NSMutableArray *filteredToDoList;

@property NSMutableArray *searchToDoList;

@property NSMutableArray *pListToDoList;

@property BOOL isSearching;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    _toDoTableView.dataSource = self;
    _toDoTableView.delegate = self;
    _searchBar.delegate = self;
    _searchBar.autocapitalizationType = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _filteredToDoList = [NSMutableArray new];
    _mainToDoList = [NSMutableArray new];
    _isSearching = false;
    
    [self initPList];
}

- (void) initPList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"todo" ofType:@"plist"];
    
    [_pListToDoList writeToFile:path atomically:YES];
    
    _pListToDoList = [[NSMutableArray alloc] initWithContentsOfFile: path];
}

//- (void) updatePList{
//    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//    for (NSDictionary *object in _pListToDoList){
//        if([[object objectForKey: @]]){
//
//        }
//    }
//}

- (void)addTodo:(ToDo *)todo {
    [_mainToDoList addObject: todo];
    _filteredToDoList = _mainToDoList;
    [_toDoTableView reloadData];
}

- (void)updateTodo:(ToDo *)object {
    int count = 0;
    for(ToDo *todo in _mainToDoList){
        if([todo.name isEqualToString: object.name]){
            [_mainToDoList replaceObjectAtIndex: count withObject: object];
            count++;
        }
    }
    NSIndexPath *index = [_toDoTableView indexPathForSelectedRow];
    [_filteredToDoList replaceObjectAtIndex: (int)index.row withObject: object];
    [_toDoTableView reloadData];
}

- (IBAction)onSegmentedTabClick:(UISegmentedControl *)sender {
    
    NSMutableArray *temp;
    switch((int)sender.selectedSegmentIndex){
        case 0:
            _filteredToDoList = _mainToDoList;
            break;
        case 1:
            temp = [NSMutableArray new];
            for(ToDo *todo in _mainToDoList){
                if(todo.status == 0){
                    [temp addObject: todo];
                }
            }
            _filteredToDoList = temp;
            break;
        case 2:
            temp = [NSMutableArray new];
            for(ToDo *todo in _mainToDoList){
                if(todo.status == 1){
                    [temp addObject: todo];
                }
            }
            _filteredToDoList = temp;
            break;
        case 3:
            temp = [NSMutableArray new];
            for(ToDo *todo in _mainToDoList){
                if(todo.status == 2){
                    [temp addObject: todo];
                }
            }
            _filteredToDoList = temp;
            break;
        case 4:
            temp = [NSMutableArray new];
            temp = (NSMutableArray*)[_mainToDoList sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                int first = [(ToDo*)a priority];
                int second = [(ToDo*)b priority];
                return first > second;
            }];
            _filteredToDoList = temp;
            break;
    }
    [_toDoTableView reloadData];
}

#pragma mark - Search Tab implementation

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        _isSearching = false;
    } else {
        _isSearching = true;
        _searchToDoList = [NSMutableArray new];
        
        for(ToDo *todo in _filteredToDoList){
            NSRange nameRange = [todo.name rangeOfString: searchText options: NSCaseInsensitiveSearch];
            
            if(nameRange.location != NSNotFound){
                [_searchToDoList addObject: todo];
            }
        }
    }
    [_toDoTableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString: @"goToToDoDetailsVC"]){
        ToDoDetailsViewController *todoDetailsVC = segue.destinationViewController;
        
        NSIndexPath *index = [_toDoTableView indexPathForSelectedRow];
        
        ToDo *todo;
        
        if(_isSearching){
            todo = [_searchToDoList objectAtIndex: index.row];
        } else {
            todo = [_filteredToDoList objectAtIndex: index.row];
        }
        
        todoDetailsVC.todo = todo;
        
        todoDetailsVC.viewController = self;
        
    } else {
        AddToDoViewController *addToDoVC = segue.destinationViewController;
        
        addToDoVC.viewController = self;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_isSearching){
        return _searchToDoList.count;
    }
    return _filteredToDoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ToDo *todo;
    
    if(_isSearching){
        todo = [_searchToDoList objectAtIndex: indexPath.row];
    } else {
        todo = [_filteredToDoList objectAtIndex: indexPath.row];
    }

    cell.textLabel.text = todo.name;
    cell.detailTextLabel.text = todo.details;

    switch(todo.priority){
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"up-arrow"];
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"minus"];
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"down-arrow"];
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if(_isSearching){
            [_searchToDoList removeObjectAtIndex: indexPath.row];
        } else {
            [_filteredToDoList removeObjectAtIndex: indexPath.row];
        }
        [tableView reloadData];
    }
}

@end
