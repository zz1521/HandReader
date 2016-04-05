//
//  HRBookListTableViewCell.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/29.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRBookListModel.h"
#import "HRCategaryBookListModel.h"
@interface HRBookListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *authourNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *chaterCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *categaryLabel;

@property (weak, nonatomic) IBOutlet UILabel *readedPersonCountLabel;


-(void)updateCategaryCellByModel:(HRCategaryBookListModel *)model;
-(void)updateCellByModel:(HRBookListModel *)model;
@end
