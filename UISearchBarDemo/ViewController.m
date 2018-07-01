//
//  ViewController.m
//  UISearchBarDemo
//
//  Created by PerTerbin on 2018/7/1.
//  Copyright © 2018年 PerTerbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Search";
    
    [self setupUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    self.navigationController.navigationBar.translucent = NO;
    self.definesPresentationContext = YES;
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchBar.placeholder = @"搜索问题";
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.searchBar.tintColor = [UIColor redColor];
    [_searchController.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
    if (@available(iOS 11.0, *)) {
        [_searchController.searchBar setPositionAdjustment:UIOffsetMake(150, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = _searchController.searchBar;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%zi", indexPath.row];
    
    return cell;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController {
    if (@available(iOS 11.0, *)) {
        [_searchController.searchBar setPositionAdjustment:UIOffsetZero forSearchBarIcon:UISearchBarIconSearch];
    }
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    if (@available(iOS 11.0, *)) {
        [_searchController.searchBar setPositionAdjustment:UIOffsetMake(150, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
}

@end
