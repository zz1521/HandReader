//
//  HRDetailBookTableViewCell.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRDetailBookTableViewCell.h"
#import "HRDetailCollectionViewCell.h"
@interface HRDetailBookTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic)NSArray *tempArray;

@end
@implementation HRDetailBookTableViewCell


-(void)updateCellByData:(NSArray *)dataArray{
    
    
    
    
}



-(void)updateCellByDataArray:(NSArray *)dataArray{
    self.tempArray = dataArray;
    [self registerCollectionCell];
    [self.collectionView reloadData];
}


-(void)registerCollectionCell{
    self.collectionView.delegate  = self;
    self.collectionView.dataSource =self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"HRDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WAY"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tempArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HRDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WAY" forIndexPath:indexPath];
    [cell updateCellByCollctionData:self.tempArray[indexPath.row]];
    return cell;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
