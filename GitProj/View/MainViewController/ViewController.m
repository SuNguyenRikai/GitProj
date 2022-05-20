//
//  ViewController.m
//  GitProj
//
//  Created by HaDTT on 19/05/2022.
//  Copyright © 2022 HaDTT. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UserDetailViewController.h"

@interface ViewController ()
@property ViewModel* model;
@property NSMutableArray* tableData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableData = [NSMutableArray array];
    _listUser.dataSource = self;
    _listUser.delegate = self;
    [_listUser registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"MyCustomCell"];
    
    _model = [[ViewModel alloc] init];
    [_model getUserDataFrom:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableData) name:@"UserListChanged" object:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];
    if (cell == nil) {
        
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCustomCell"];
    }

    [cell.avatar sd_setImageWithURL:[NSURL URLWithString:[(User*)_tableData[indexPath.row] avatarURL]]];
    cell.name.text = [(User*)_tableData[indexPath.row] login];
    cell.siteAdmin.text = [(User*)_tableData[indexPath.row] siteAdmin];
    [cell updateUI];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 67;
}

-(void)updateTableData {
    [_tableData addObjectsFromArray:self.model.data.listUsers];
    [_listUser reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UserDetailViewController *userDetail = [[UserDetailViewController alloc] initWithNibName:@"UserDetailViewController" bundle:nil];
    userDetail.userName = [(User*)_tableData[indexPath.row] login];
    [self presentViewController:userDetail animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _tableData.count - 1) {
        int since = [(User*)_tableData.lastObject userID];
        [_model getUserDataFrom:since];
    }
}

@end
