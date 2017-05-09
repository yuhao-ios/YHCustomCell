//
//  MyModel.h
//  非等高Cell
//
//  Created by t4 on 17/5/8.
//  Copyright © 2017年 t4. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property(nonatomic,strong)NSString * img;

@property(nonatomic,strong)NSString * name;

@property(nonatomic,strong)NSString * title;

@property(nonatomic,strong)NSString * subtitle;

@property(nonatomic,strong)NSArray  * imgArray;

@property(nonatomic,strong)NSString * time;

@property(nonatomic,strong)NSString * adress;

@property(nonatomic,assign)NSInteger assistCount;

@property(nonatomic,assign)NSInteger comentCount;


+(instancetype)loadModelForDic:(NSDictionary *)dic;
@end
