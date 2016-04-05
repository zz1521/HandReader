//
//  HRCartoonTableViewCell.m
//  HandReader
//
//  Created by qianfeng on 16/4/1.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonTableViewCell.h"

@implementation HRCartoonTableViewCell

-(void)upDateWithModel:(HRCartoonModel*)model{
    [self.HRCartoonImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.HRCartoonNameLabel.text      = model.name;
    self.HRCartoonNickName.text       = model.nickname;
    self.HRCatoonExtraValueLable.text = model.extraValue;
    self.HRCartoonDescriptionLable.text = model.hr_description;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
