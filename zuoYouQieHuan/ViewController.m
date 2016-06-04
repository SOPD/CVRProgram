//
//  ViewController.m
//  zuoYouQieHuan
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "ViewController.h"
#import "ZXUIView.h"
#define HALF_SCREEN ([UIScreen mainScreen].bounds.size.width/2)
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    

    ZXUIView *view=[ZXUIView new];
    view.pictures= @[[UIImage imageNamed:@"20130820124935_kQQLU.thumb.600_0"],[UIImage imageNamed:@"20130820124941_TukyW.thumb.600_0"],[UIImage imageNamed:@"20120512224320_XAHuP.thumb.700_0"],[UIImage imageNamed:@"20150105184318_w8HPK"]];
  //  [UIImage imageNamed:@"1"];
    
    self.view=view;
    
}

@end
