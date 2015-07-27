//
//  ViewController.m
//  城市选择
//
//  Created by 袁昊 on 15/4/16.
//  Copyright (c) 2015年 yh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray* provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
    NSLog(@"%@",provinces);

    for (int i = 0 ; i < provinces.count; i++) {
        NSLog(@"~~~~~~%@~~~~~~",[provinces[i] objectForKey:@"state"]);
        NSArray *arr = [provinces[i] objectForKey:@"cities"];
        for (int j = 0; j < arr.count; j++) {
            NSLog(@"--------- %@",[arr[j] objectForKey:@"city"]);
//            NSLog(@"------%@",[arr[j] objectForKey:@"lat"]);
//            NSLog(@"----%@",[arr[j] objectForKey:@"lon"]);
        }
    }

   
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = @"1";
    cell.textLabel.frame = CGRectMake(100, 0, 320, 45);
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else if (section == 1)
    {
        return 10;
    }else{
        return 40;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }else if (section == 1)
    {
        return 10;
    }else{
        return 40;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[[UIView alloc]init] autorelease];
    
//    view.backgroundColor = Color_E4E4E4;
    view.backgroundColor = [UIColor redColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 20)] ;
//    [view addSubview:label];
//    [label release];
//    label.backgroundColor = [UIColor clearColor];
//    label.font = [UIFont systemFontOfSize:13];
//    label.textColor = [UIColor lightGrayColor];
//    label.text= @"地区";
    return view;
}



-(void)dataInit
{
   NSArray* provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil]];
    NSLog(@"%@",provinces);
   NSArray* cities = [[provinces objectAtIndex:0] objectForKey:@"Cities"];
    NSLog(@"@@~~!!%@",cities);
    //初始化默认数据
//    self.locate = [[TSLocation alloc] init];
//    self.locate.state = [[provinces objectAtIndex:0] objectForKey:@"State"];
//    self.locate.city = [[cities objectAtIndex:0] objectForKey:@"city"];
//    self.locate.latitude = [[[cities objectAtIndex:0] objectForKey:@"lat"] doubleValue];
//    self.locate.longitude = [[[cities objectAtIndex:0] objectForKey:@"lon"] doubleValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
