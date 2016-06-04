//
//  ViewController.m
//  ChangeView
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "ViewController.h"
#import "FatherChildScrollerView.h"
@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIScrollView *childScrollerView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FatherChildScrollerView *fcVw=[[FatherChildScrollerView alloc]init];
    fcVw.backgroundColor=[UIColor blackColor];
    fcVw.frame=[UIScreen mainScreen].bounds;
    [self.view addSubview:fcVw];
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
