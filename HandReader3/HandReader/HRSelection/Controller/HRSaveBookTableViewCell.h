//
//  HRSaveBookTableViewCell.h
//  HandReader
//
//  Created by qianfeng0 on 16/4/2.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRSaveBookModel.h"

typedef void(^JumpBlock)(UIButton *button,NSIndexPath *indexPath);

@interface HRSaveBookTableViewCell : UITableViewCell
{
    NSMutableArray *dataSourceTemp;
    JumpBlock jumpblock;
    NSIndexPath *indexPathTemp;
}


@property (weak, nonatomic) IBOutlet UIButton *leftBookButton;
@property (weak, nonatomic) IBOutlet UIButton *middleBookButton;
@property (weak, nonatomic) IBOutlet UIButton *rigghtBookButton;


-(void)updateCellBydataSource:(NSMutableArray *)dataSource  indexPath:(NSIndexPath *)indexPath;


@end
