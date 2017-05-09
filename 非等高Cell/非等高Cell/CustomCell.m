//
//  CustomCell.m
//  非等高Cell
//
//  Created by t4 on 17/5/8.
//  Copyright © 2017年 t4. All rights reserved.
//

#import "CustomCell.h"
#import "Masonry.h"
#import "CustomBtn.h"
#define ImageWidth ([UIScreen mainScreen].bounds.size.width-40-30)/3;

@interface CustomCell ()

@property(nonatomic,strong)NSArray *imageArray;

@property(nonatomic,strong)UIImageView *iconImageView;

@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)UILabel *titleTextLabel;

@property(nonatomic,strong)UILabel *detailLabel;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UILabel *adressLabel;

@property(nonatomic,strong)UIView *lineView; //时间和地点的分割线

@property(nonatomic,strong)CustomBtn *assistBtn;//点赞按钮

@property(nonatomic,strong)CustomBtn *commentBtn;//评论按钮
@property(nonatomic,strong)UIView *backView;//评论按钮
@end


@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}


#pragma mark  初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self layOutView];
    }

    return self;

}

-(void) layOutView {

    self.iconImageView = [[UIImageView alloc]init];
    self.iconImageView.clipsToBounds = YES;
    
    self.iconImageView.layer.cornerRadius = 25/2;

    
    [self.contentView addSubview:self.iconImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    
    self.nameLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.nameLabel];
    
    self.titleTextLabel = [[UILabel alloc]init];
    
    self.titleTextLabel.font = [UIFont systemFontOfSize:16];
    self.timeLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleTextLabel];
    
    self.detailLabel = [[UILabel alloc]init];
    
    self.detailLabel.textColor = [UIColor lightGrayColor];
    self.detailLabel.font = [UIFont systemFontOfSize:13];
    self.detailLabel.textAlignment = NSTextAlignmentLeft;
    self.detailLabel.numberOfLines = 0;
    [self.contentView addSubview:self.detailLabel];
   
    self.backView = [[UIView alloc]init];
    
    [self.contentView addSubview:self.backView];
    
    
   
    self.timeLabel = [[UILabel alloc]init];
    
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.numberOfLines = 0;
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:self.lineView];
    
    self.adressLabel = [[UILabel alloc]init];
    
    self.adressLabel.numberOfLines = 0;
    self.adressLabel.font = [UIFont systemFontOfSize:10];
    self.adressLabel.textAlignment = NSTextAlignmentLeft;
    self.adressLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.adressLabel];
    

    self.assistBtn = [CustomBtn loadButtonWithImageName:@"点赞" Title:@""];
    [self.assistBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.assistBtn];

    self.commentBtn = [CustomBtn loadButtonWithImageName:@"评论" Title:@""];
    [self.commentBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.commentBtn];
    
    
}

-(void)layoutSubviews {

    [super layoutSubviews];
    
    if (self.model) {
        self.iconImageView.image = [UIImage imageNamed:self.model.img];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(8);
            make.left.equalTo(self).offset(8);
            make.size.mas_equalTo(CGSizeMake(25, 25));
            
        }];
        
        self.nameLabel.text = self.model.name;
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.iconImageView.mas_top);
            make.left.equalTo(self.iconImageView.mas_right).offset(5);
            make.size.mas_equalTo(CGSizeMake(200, 20));
        }];
        
        self.titleTextLabel.text = self.model.title;
        [self.titleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.nameLabel.mas_left);
            
            make.top.equalTo(self.nameLabel.mas_bottom).offset(4);
            
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-40);
            
            
        }];
        
        self.detailLabel.text = self.model.subtitle;
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.titleTextLabel.mas_bottom).offset(4);
            make.left.equalTo(self.nameLabel.mas_left);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-40);
        }];
        
        
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.detailLabel.mas_bottom).offset(10);
            make.left.equalTo(self.nameLabel.mas_left);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-40);
            make.height.mas_equalTo([self imageHeight ]);
        }];
        
        [self layoutIfNeeded];
        CGFloat imageWidth = ([UIScreen mainScreen].bounds.size.width-40-30)/3;
        NSLog(@"%lu",(unsigned long)self.model.imgArray.count);
        if (self.model.imgArray.count > 0) {
            
            for (UIView *myView in self.backView.subviews) {
                [myView removeFromSuperview];
            }
            
            for (int i = 0; i<self.model.imgArray.count; i++) {
                
                UIImageView *imageView = [[UIImageView alloc]init];
                
                int  row = i/3;
                int  col = i%3;
                
                CGFloat cellX =  col * ( imageWidth + 10);
                CGFloat cellY =  row * (imageWidth + 10);
                
                imageView.frame = CGRectMake(cellX, cellY, imageWidth, imageWidth);
                imageView.image = [UIImage imageNamed:self.model.imgArray[i]];
                [self.backView addSubview:imageView];
            }
           [self layoutIfNeeded];
        }
        
        self.timeLabel.text =self.model.time;
        
        if (self.imageArray.count == 0) {
            [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.detailLabel.mas_bottom).offset(5);
                make.left.equalTo(self.nameLabel.mas_left);
                make.height.mas_equalTo(20);
            }];
        }else {
        
        
        }
        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.timeLabel.mas_top).offset(5);
            make.left.equalTo(self.timeLabel.mas_right).offset(2);
            make.bottom.equalTo(self.timeLabel.mas_bottom).offset(-5);
            make.width.mas_equalTo(1.5);
            
        }];
        
        self.adressLabel.text =self.model.adress;
        [self.adressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_top);
            make.left.equalTo(self.lineView.mas_right).offset(2);
            make.height.mas_equalTo(20);
            
        }];
        [self.commentBtn setTitle:[NSString stringWithFormat:@"%ld",self.model.comentCount] forState:UIControlStateNormal];
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self.timeLabel.mas_top);
            make.height.equalTo(self.timeLabel);
            make.width.mas_equalTo(60);
            
        } ];
        
        [self.assistBtn setTitle:[NSString stringWithFormat:@"%ld",self.model.assistCount] forState:UIControlStateNormal];
        [self.assistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.commentBtn);
            make.right.equalTo(self.commentBtn.mas_left).offset(-10);
            make.top.equalTo(self.timeLabel.mas_top);
            
        }];
        
        
        [self layoutIfNeeded];
        
    }

   
}

-(void)setModel:(MyModel *)model{

    _model = model;
    
    

}

#pragma mark  计算高


-(CGFloat)imageHeight{
  
    
    if (self.model.imgArray.count == 0) {
        
        [self.backView removeFromSuperview];
        return 0;
    }
    
    if (self.model.imgArray.count <= 3 && self.model.imgArray.count >0) {
     
      CGFloat height =  10 + ImageWidth;
     
      return height;
    }
    
    if(3< self.model.imgArray.count  && self.model.imgArray.count <= 6){
        
        CGFloat height = 20 + 2 * ImageWidth ;
        return height;
    }
  
    return 30 + 3*ImageWidth ;
}


-(CGFloat)cellHeight{

    [self layoutIfNeeded];
  
    return  CGRectGetMaxY(self.timeLabel.frame)+10;

}
@end
