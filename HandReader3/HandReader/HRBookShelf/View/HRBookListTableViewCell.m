//
//  HRBookListTableViewCell.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/29.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRBookListTableViewCell.h"

@implementation HRBookListTableViewCell

-(void)updateCellByModel:(HRBookListModel *)model{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.coverImgUrl]];
    self.bookNameLabel.text = model.book_name;
    self.authourNameLabel.text = model.author;
    self.chaterCountLabel.text =[NSString stringWithFormat:@"%ld章",(long)model.last_sort] ;
    self.readedPersonCountLabel.text = [NSString stringWithFormat:@"%ld名用户阅读过此书",(long)model.subscribeCount];
    self.categaryLabel.text = model.category;
}


-(void)updateCategaryCellByModel:(HRCategaryBookListModel *)model{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    self.bookNameLabel.text = model.name;
    self.authourNameLabel.text = model.author;
    self.chaterCountLabel.text =[NSString stringWithFormat:@"%ld章",(long)model.chapterCount] ;
    self.readedPersonCountLabel.text = [NSString stringWithFormat:@"%ld名用户阅读过此书",(long)model.subscribeCount];
    self.categaryLabel.text = model.category;
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
