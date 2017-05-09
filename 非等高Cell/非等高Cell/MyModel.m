//
//  MyModel.m
//  非等高Cell
//
//  Created by t4 on 17/5/8.
//  Copyright © 2017年 t4. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel



+(instancetype)loadModelForDic:(NSDictionary *)dic{

    MyModel *model = [[MyModel alloc]init];
    model.img = dic [@"img"];
    model.name =dic[@"name"];
    model.title = dic[@"title"];
    model.subtitle =dic[@"subtitle"];
    model.imgArray = dic[@"imgArray"];
    model.time = dic[@"time"];
    model.adress =dic[@"adress"];
    model.comentCount = [dic[@"comentCount"] integerValue];
    model.assistCount = [dic[@"assistCount"] integerValue];

    return model;

}

@end
