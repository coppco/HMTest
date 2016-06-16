//
//  HJContactController.m
//  01-通讯录
//
//  Created by M-coppco on 16/3/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJContactController.h"
#import "HJAddController.h"
#import "HJContact.h"
#import "HJEditController.h"
#import "HJContactCell.h"

@interface HJContactController ()
@property (nonatomic, strong)NSMutableArray  *array;
@end

@implementation HJContactController
- (IBAction)logout:(UIBarButtonItem *)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否注销?" preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        NSLog(@"1");
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [self presentViewController:alertVC animated:YES completion:nil];
}
- (NSMutableArray *)array {
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"add"]) {
        HJAddController *VC = segue.destinationViewController;
        [VC setAddBlock:^(NSString *name, NSString *phone) {
            HJContact *contact = [[HJContact alloc] initWithName:name phone:phone];
            [self.array addObject:contact];
            [self.tableView reloadData];
        }];
    } else if ([segue.identifier isEqualToString:@"edit"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        ((HJEditController *)segue.destinationViewController).contact = self.array[index.row];
        [((HJEditController *)segue.destinationViewController) setSaveBlock:^(HJContact *contact) {
//            [self.array replaceObjectAtIndex:index.row withObject:contact];
            [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:(UITableViewRowAnimationFade)];
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //加上
    HJContactCell *cell = [HJContactCell contactCellWithTableView:tableView];
    cell.contact = self.array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"edit" sender:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
