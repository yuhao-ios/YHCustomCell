//
//  ViewController.m
//  非等高Cell
//
//  Created by t4 on 17/5/8.
//  Copyright © 2017年 t4. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "MyModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView ;
/**存放所有cell高度的字典*/
@property(strong,nonatomic)NSMutableDictionary *heightDic;

@property(strong,nonatomic)NSArray *dataArray;

@property(strong,nonatomic)NSMutableArray *dataModelArray;


@end

@implementation ViewController



-(NSMutableArray *)dataModelArray{

    if (_dataModelArray == nil) {
        _dataModelArray = [NSMutableArray array];
    }
    return _dataModelArray;
}


- (NSMutableDictionary *)heightDic{
    if (_heightDic == nil) {
        _heightDic = [NSMutableDictionary dictionary];
    }
    
    return _heightDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.dataArray = @[@{@"img":@"IMG_0069.JPG",@"name":@"不会游泳的鱼",@"title":@"还是野钓比较爽",@"subtitle":@"",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"4小时前",@"adress":@"湖南省湘潭市湘潭县",@"assistCount":@"2",@"comentCount":@"25"},@{@"img":@"IMG_0069.JPG",@"name":@"剪辑这从前",@"title":@"从游钓天下商城买的途酷钓伞",@"subtitle":@"",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"2小时前",@"adress":@"湖南省长沙市",@"assistCount":@"5",@"comentCount":@"378"},@{@"img":@"IMG_0069.JPG",@"name":@"会飞的鱼",@"title":@"",@"subtitle":@"这样玩路亚 绝对因为热爱  而不是为了鱼总把鱼看得太重 路亚你会很累 放松心态。。。。",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"3小时前",@"adress":@"上海闵行区",@"assistCount":@"19",@"comentCount":@"36"},@{@"img":@"IMG_0069.JPG",@"name":@"飞鱼的眼泪是水",@"title":@"晒干的白条，蒸着吃太美味了。。。",@"subtitle":@"这样玩路亚 绝对因为热爱  而不是为了鱼总把鱼看得太重 路亚你会很累 放松心态。。。",@"imgArray":@[],@"time":@"8小时前",@"adress":@"上海市宝山区顾村公园",@"assistCount":@"2",@"comentCount":@"25"},@{@"img":@"IMG_0069.JPG",@"name":@"不会游泳的鱼",@"title":@"还是野钓比较爽",@"subtitle":@"",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"4小时前",@"adress":@"湖南省湘潭市湘潭县",@"assistCount":@"2",@"comentCount":@"25"},@{@"img":@"IMG_0069.JPG",@"name":@"剪辑这从前",@"title":@"从游钓天下商城买的途酷钓伞",@"subtitle":@"",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"2小时前",@"adress":@"湖南省长沙市",@"assistCount":@"5",@"comentCount":@"378"},@{@"img":@"IMG_0069.JPG",@"name":@"会飞的鱼",@"title":@"",@"subtitle":@"这样玩路亚 绝对因为热爱  而不是为了鱼总把鱼看得太重 路亚你会很累 放松心态。。。。",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"3小时前",@"adress":@"上海闵行区",@"assistCount":@"19",@"comentCount":@"36"},@{@"img":@"IMG_0069.JPG",@"name":@"飞鱼的眼泪是水",@"title":@"晒干的白条，蒸着吃太美味了。。。",@"subtitle":@"这样玩路亚 绝对因为热爱  而不是为了鱼总把鱼看得太重 路亚你会很累 放松心态。。。",@"imgArray":@[],@"time":@"8小时前",@"adress":@"上海市宝山区顾村公园",@"assistCount":@"2",@"comentCount":@"25"},@{@"img":@"IMG_0069.JPG",@"name":@"不会游泳的鱼",@"title":@"还是野钓比较爽",@"subtitle":@"",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"4小时前",@"adress":@"湖南省湘潭市湘潭县",@"assistCount":@"2",@"comentCount":@"25"},@{@"img":@"IMG_0069.JPG",@"name":@"剪辑这从前",@"title":@"从游钓天下商城买的途酷钓伞",@"subtitle":@"",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"2小时前",@"adress":@"湖南省长沙市",@"assistCount":@"5",@"comentCount":@"378"},@{@"img":@"IMG_0069.JPG",@"name":@"会飞的鱼",@"title":@"",@"subtitle":@"这样玩路亚 绝对因为热爱  而不是为了鱼总把鱼看得太重 路亚你会很累 放松心态。。。。",@"imgArray":@[@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG",@"IMG_0069.JPG"],@"time":@"3小时前",@"adress":@"上海闵行区",@"assistCount":@"19",@"comentCount":@"36"},@{@"img":@"IMG_0069.JPG",@"name":@"飞鱼的眼泪是水",@"title":@"晒干的白条，蒸着吃太美味了。。。",@"subtitle":@"这样玩路亚 绝对因为热爱  而不是为了鱼总把鱼看得太重 路亚你会很累 放松心态。。。",@"imgArray":@[],@"time":@"8小时前",@"adress":@"上海市宝山区顾村公园",@"assistCount":@"2",@"comentCount":@"25"}];
    
    
    for (NSDictionary *dic in self.dataArray) {
        
        MyModel *model = [MyModel loadModelForDic:dic];
        
        [self.dataModelArray addObject:model];
    }
    
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    

}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataModelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

   static NSString * cellID = @"cell";
    
    //CustomCell *cell = [tableView cellForRowAtIndexPath:indexPath];
     CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID ];
    }
    cell.model = self.dataModelArray[indexPath.row];

    self.heightDic[@(indexPath.row)] = @(cell.cellHeight);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return [self.heightDic[@(indexPath.row)] doubleValue];
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}
@end
