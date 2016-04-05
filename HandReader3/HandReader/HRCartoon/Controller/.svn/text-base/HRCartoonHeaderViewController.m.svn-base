//
//  HRCartoonHeaderViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/4.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonHeaderViewController.h"

@interface HRCartoonHeaderViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *allClickCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation HRCartoonHeaderViewController


-(instancetype)initWithModel:(HRCartoonComicModel *)model{
    if (self = [super init]) {
        self.comicModel = model;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateUI];
}

-(void)updateUI{
    NSURL *imageUrl = [NSURL URLWithString:self.comicModel.cover];
    [self.iconImageView sd_setImageWithURL:imageUrl];
    self.titleNameLabel.text = self.comicModel.name;
    self.categaryLabel.text = self.comicModel.theme_ids;
    self.textView.text = self.comicModel.hr_description;
    self.allClickCountLabel.text = self.comicModel.click_total;
    self.authorNameLabel.text = self.comicModel.author_name;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
