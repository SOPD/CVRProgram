//
//  ViewController.m
//  HeaderPictureZoomer
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "ViewController.h"
#import "ZXScrollView.h"
@interface ViewController ()<UIScrollViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view=[UIView new];


    view.frame=CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    
    [self.view addSubview:[[ZXScrollView alloc] initWithPicutre:[UIImage imageNamed:@"5ee372ff039073317a49af5442748071"] BottomView:view]];

    

}

//若需要当下移到图片消失时由bottomView响应滑动 打开该方法 bottom需要继承自scrollView并设置代理

//注意! 若使用tableView 请将头部图片添加到tableHeaderView无需设置该代理方法思路参考ZXScrollView


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    UIScrollView *superScro=(UIScrollView *)scrollView.superview;
//    if ((superScro.contentOffset.y+scrollView.contentOffset.y)<=200.0) {
//        superScro.contentOffset=CGPointMake(0, superScro.contentOffset.y+scrollView.contentOffset.y);
//        scrollView.contentOffset=CGPointMake(0.0, 0);
//   
//    }
//}
@end
