//
//  HRDetailCollectionViewCell.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRDetailCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *readCountLabel;
-(void)updateCellByCollctionData:(NSDictionary *)dic;
@end
