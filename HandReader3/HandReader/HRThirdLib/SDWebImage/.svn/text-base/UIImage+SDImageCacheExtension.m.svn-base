//
//  UIImage+SDImageCacheExtension.m
//  ContactWorks
//
//  Created by qh on 15/6/30.
//  Copyright (c) 2015年 Beijing ZincTech. All rights reserved.
//

#import "UIImage+SDImageCacheExtension.h"

@implementation UIImage (SDImageCacheExtension)

+ (UIImage *)cachedImageWithURL:(NSString *)urlString
{
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    UIImage *image = [imageCache imageFromDiskCacheForKey:[manager cacheKeyForURL:[NSURL URLWithString:urlString]]];
    
    return image;
}

@end
