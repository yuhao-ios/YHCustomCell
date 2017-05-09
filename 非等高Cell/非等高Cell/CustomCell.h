//
//  CustomCell.h
//  非等高Cell
//
//  Created by t4 on 17/5/8.
//  Copyright © 2017年 t4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
@interface CustomCell : UITableViewCell


@property(nonatomic,strong)MyModel * model;

-(CGFloat) cellHeight;


@end
