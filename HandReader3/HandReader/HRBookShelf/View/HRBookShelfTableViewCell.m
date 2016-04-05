//
//  HRBookShelfTableViewCell.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRBookShelfTableViewCell.h"

@implementation HRBookShelfTableViewCell

-(void)updateCellByModel:(HRBookShelfModel *)model{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.coverImgUrl]];
    self.WebNameLabel.text = model.rankName;
    self.booksNameLabel.text = model.book_name;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
