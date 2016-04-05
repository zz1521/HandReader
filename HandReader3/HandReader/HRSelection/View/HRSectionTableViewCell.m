//
//  HRSectionTableViewCell.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRSectionTableViewCell.h"

@implementation HRSectionTableViewCell

-(void)setCellByModel:(HRCommonModel *)model{
    NSString *strImageUrl = [NSString stringWithFormat:HR_URL_ICON,model.BookId];
    NSURL *imageUrl = [NSURL URLWithString:strImageUrl];
    [self.lpf_IconImageView sd_setImageWithURL:imageUrl];
    self.lpf_TitleLabel.text = model.BookName;
    self.lpf_descLabel.text = model.Description;
    self.lpf_NameLabel.text = model.Author;
    self.lpf_CategaryLabel.text = model.CategoryName;
    self.lpf_KindsLabel.text = model.BookStatus;
    self.lpf_WordNumber.text =[NSString stringWithFormat:@"%ld万字",model.WordsCount/10000]; ;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
