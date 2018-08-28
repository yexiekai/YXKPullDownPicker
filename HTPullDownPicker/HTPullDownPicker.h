//
//  HTPullDownPicker.h
//  HTPullDownPicker
//
//  Created by admin on 16/3/7.
//  Copyright (c) 2016年 HengTian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HTPullDownPickerDelegate <NSObject>
/**
 *  @method             pullDownSelect
 *  @abstract           call from selected
 *  @discussion         call from selected
 */
- (void)pullDownSelect;

@end

@interface HTPullDownPicker : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *pullDownTable;
@property (nonatomic, strong) UIButton *pullDownButton;
@property (nonatomic) CGRect pullDownTableFrame;
@property (nonatomic, strong) NSArray *pickerData;
@property (nonatomic) NSInteger rowNum;
@property (nonatomic) NSInteger rowHeight;
@property (nonatomic, strong) NSString *pickerValue;

@property (nonatomic, assign) id <HTPullDownPickerDelegate> delegate;

/**
 *  @method             initWithFrame
 *  @abstract           init a HTPullDownPicker
 *  @discussion         init a HTPullDownPicker
 *  @param frame        PullDownPickerFrame
 *  @param superView    PullDownPicker's father view
 *  @param pickerData   selection data
 */
- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView pickerData:(NSArray *)pickerData;

/**
 *  @method             initWithFrame
 *  @abstract           init a HTPullDownPicker
 *  @discussion         init a HTPullDownPicker
 *  @param frame        PullDownPickerFrame
 *  @param superView    PullDownPicker's father view
 *  @param tableFrame   PullDownTableFrame
 *  @param pickerData   selection data
 *  @param rowNum       PullDownTable's row number
 *  @param rowHeight    PullDownTable's row height
 */
- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView tableFrame:(CGRect)tableFrame pickerData:(NSArray *)pickerData rowNum:(NSInteger)rowNum rowHeight:(NSInteger)rowHeight;

@end
