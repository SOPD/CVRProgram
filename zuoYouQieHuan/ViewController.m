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
    view.pictures= @[[UIImage imageNamed:@"2010e3a0c7f88c3f5f5803bf66addd93"],
                    [UIImage imageNamed:@"37e4761e6ecf56a2d78685df7157f097"],
                    [UIImage imageNamed:@"5ee372ff039073317a49af5442748071"],
                    [UIImage imageNamed:@"9b437cdfb3e3b542b5917ce2e9a74890"]];
    self.view=view;
    
}

@end
