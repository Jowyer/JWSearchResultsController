//
//  ViewController.m
//  JWSearchResultsController
//
//  Created by Jowyer on 14/10/28.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UITableView Datasource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"ButtonSegue" sender:nil];
            break;
        case 1:
            [self performSegueWithIdentifier:@"TableSegue" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"NavigatorSegue" sender:nil];
            break;
            
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Search Button";
            break;
        case 1:
            cell.textLabel.text = @"Search Bar in TableView";
            break;
        case 2:
            cell.textLabel.text = @"Search Bar in Navigator";
            break;
            
        default:
            break;
    }
}

@end
