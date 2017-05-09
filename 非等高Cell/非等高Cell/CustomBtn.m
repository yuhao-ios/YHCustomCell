
//
//  CustomBtn.m
//  非等高Cell
//
//  Created by t4 on 17/5/8.
//  Copyright © 2017年 t4. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

+(instancetype)loadButtonWithImageName:(NSString *)name Title:(NSString *)title{
    
    CustomBtn *btn = [[CustomBtn alloc]init];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.titleLabel.textColor = [UIColor blackColor];
   
    return btn;
    
}


#pragma mark  - 第一种方法  设置图片视图  文字label 的尺寸
/**contentRect 按钮的尺寸*/
/*- (CGRect)imageRectForContentRect:(CGRect)contentRect{
 
 
 return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height-30);
 }
 
 -(CGRect)titleRectForContentRect:(CGRect)contentRect{
 
 
 return CGRectMake(0, contentRect.size.height-30, contentRect.size.width, 30);
 }
 */

#pragma mark  - 第二种方法  在layoutSubviews 重新 修改图片视图  文字label的尺寸
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.frame = CGRectMake(2, 2, (self.frame.size.width-9)/2, self.frame.size.height-4);
    
    self.titleLabel.frame = CGRectMake((self.frame.size.width-5)/2+5, 0, (self.frame.size.width-5)/2, self.frame.size.height);
    
    
    
}

@end
