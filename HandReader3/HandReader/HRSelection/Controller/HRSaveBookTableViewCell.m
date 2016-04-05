//
//  HRSaveBookTableViewCell.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/2.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRSaveBookTableViewCell.h"
#import "HRReadViewController.h"
#import "HRBookDetailViewController.h"

@implementation HRSaveBookTableViewCell

-(void)updateCellBydataSource:(NSMutableArray *)dataSource indexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%@",dataSource);
    dataSourceTemp = [NSMutableArray array];
    dataSourceTemp = dataSource;
    for (int i = 0; i < 3; i++) {
        if ([dataSource count]-1 < indexPath.row * 3+i || [dataSource count] == 0) {
            break;
        }
        indexPathTemp = indexPath;
        UIButton *button = (UIButton *)[self viewWithTag:10+i];
        HRSaveBookModel *model = dataSource[indexPath.row * 3 + i];
        [button setImage:model.bookImageData forState:(UIControlStateNormal)];
        [button setBackgroundImage:[UIImage imageNamed:@"book_bg"] forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(jumpToBook:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
}


-(void)jumpToBook:(UIButton *)button{
    HRSaveBookModel *model = dataSourceTemp[indexPathTemp.row * 3 + button.tag - 10];
    NSLog(@"%@----%ld----%ld----%ld----%@",model.name,model.gid,model.nid,model.sort,model.chapter_name);
    if (model.sort) {
        HRReadViewController *readerVC = [[HRReadViewController alloc] init];
        readerVC.gid = model.gid;
        readerVC.nid = model.nid;
        readerVC.sort = model.sort;
        readerVC.chapter_name = model.chapter_name;
        //找到UIViewController ，使用事件响应链
        UIViewController *viewController = [self currentResponder];
        readerVC.hidesBottomBarWhenPushed = YES;
        [viewController.navigationController pushViewController:readerVC animated:YES];
    }else{
        HRBookDetailViewController *detailVC = [[HRBookDetailViewController alloc] init];
        detailVC.gid = model.gid;
        UIViewController *viewController = [self currentResponder];
        detailVC.hidesBottomBarWhenPushed = YES;
        [viewController.navigationController pushViewController:detailVC animated:YES];
    }

}

-(UIViewController *)currentResponder{
    UIResponder *object = self.nextResponder;
    while (object != nil && ![object isKindOfClass:[UIViewController class]]) {
        object = object.nextResponder;
    }
    UIViewController *viewController = (UIViewController*)object;
    return viewController;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
