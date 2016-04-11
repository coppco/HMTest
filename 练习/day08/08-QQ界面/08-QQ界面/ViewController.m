//
//  ViewController.m
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJMessageModel.h"
#import "HJChatCell.h"
#import "HJMessageFrameModel.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray  *messages;
@end

@implementation ViewController
- (NSMutableArray *)messages {
    if (_messages == nil) {
        _messages = [NSMutableArray array];
        NSArray *array = [HJMessageModel messageArray];
        for (HJMessageModel *model in array) {
            HJMessageFrameModel *frame = [[HJMessageFrameModel alloc] init];
            frame.message = model;

            [_messages addObject:frame];
        }
    }
    return _messages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSoource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HJChatCell *cell = [HJChatCell chatCellWithTableView:tableView];
    HJMessageFrameModel *frame = _messages[indexPath.row];
    cell.frameMessage = frame;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.messages[indexPath.row] cellH];
}
@end
