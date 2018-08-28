//
//  HTPullDownPicker.m
//  HTPullDownPicker
//
//  Created by admin on 16/3/7.
//  Copyright (c) 2016年 HengTian. All rights reserved.
//

#import "HTPullDownPicker.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation HTPullDownPicker

- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView pickerData:(NSArray *)pickerData
{
    return [self initWithFrame:frame superView:superView tableFrame:CGRectMake(0, frame.origin.y + frame.size.height, SCREEN_WIDTH, 160) pickerData:pickerData rowNum:4 rowHeight:40];
}

- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView tableFrame:(CGRect)tableFrame pickerData:(NSArray *)pickerData rowNum:(NSInteger)rowNum rowHeight:(NSInteger)rowHeight
{
    self = [super initWithFrame:frame];
    _pullDownButton = [[UIButton alloc] init];
    CGRect buttonRect = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _pullDownButton.frame = buttonRect;
    _pullDownButton.backgroundColor = [UIColor whiteColor];
    [_pullDownButton setTitle:@"v" forState:UIControlStateNormal];
    [_pullDownButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _pullDownTable = [[UITableView alloc] init];
    _pullDownTable.dataSource = self;
    _pullDownTable.delegate = self;
    _pullDownTableFrame = tableFrame;
    _rowNum = rowNum;
    _rowHeight = rowHeight;
    _pickerData = [[NSArray alloc] initWithArray:pickerData];
    
    [_pullDownButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pullDownButton];
    [superView addSubview:_pullDownTable];
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rowNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _pickerData[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _pickerValue = _pickerData[indexPath.row];
    if (_delegate && [_delegate respondsToSelector:@selector(pullDownSelect)]) {
        [_delegate pullDownSelect];
    }
}

- (void)buttonClicked:(UIButton *)button
{
    button.selected = !button.selected;
    if (button.selected) {
        _pullDownTable.frame = CGRectMake(_pullDownTableFrame.origin.x, _pullDownTableFrame.origin.y, _pullDownTableFrame.size.width, 0);
        [_pullDownButton setTitle:@"^" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.3 animations:^{
            _pullDownTable.frame = _pullDownTableFrame;
            [_pullDownTable reloadData];
        }];
    }
    else
    {
        [_pullDownButton setTitle:@"v" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.3 animations:^{
            _pullDownTable.frame = CGRectMake(_pullDownTableFrame.origin.x, _pullDownTableFrame.origin.y, _pullDownTableFrame.size.width, 0);
        }];
    }
}

@end
