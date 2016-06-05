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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建视图
    FatherChildScrollerView *fcVw=[[FatherChildScrollerView alloc]initWithNumOfChildPage:4];
    //添加frame
    fcVw.frame=[UIScreen mainScreen].bounds;
    [self.view addSubview:fcVw];
    
    
    
    /**
     *  内容添加示例
     *
     */
    //添加子scrollView内容
 [fcVw.headerViews enumerateObjectsUsingBlock:^(UIView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
     UIImageView *imgVw=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%lu",(unsigned long)idx+1]]];
     imgVw.frame=obj.bounds;
     
     NSLog(@"%@",NSStringFromCGRect(obj.bounds));
     imgVw.contentMode=UIViewContentModeScaleAspectFill;
     [obj addSubview:imgVw];
     
 }];
    
    //添加底部弹出view内容
    UIImageView *bottom=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bottom"]];
    bottom.frame=fcVw.BottomView.bounds;
    bottom.contentMode=UIViewContentModeScaleAspectFill;
    bottom.clipsToBounds=YES;
    [fcVw.BottomView addSubview:bottom];
    
    //添加附加视图内容
    UIImageView *attach=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"attach"]];
    attach.frame=fcVw.AttachView.bounds;
    [fcVw.AttachView addSubview:attach];
    
    //添加home视图内容
    UIImageView *home=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"up"]];
    home.frame=fcVw.HomeView.bounds;
    [fcVw.HomeView addSubview:home];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
