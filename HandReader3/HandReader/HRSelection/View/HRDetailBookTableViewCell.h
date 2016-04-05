//
//  HRDetailBookTableViewCell.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRDetailBookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

-(void)updateCellByDataArray:(NSArray *)dataArray;

-(void)updateCellByData:(NSArray *)dataArray;
@end
