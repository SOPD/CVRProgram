//
//  ZXScrollView.m
//  HeaderPictureZoomer
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "ZXScrollView.h"
#define IMG_H 200
@interface ZXScrollView ()<UIScrollViewDelegate>

//下部VIEW
@property (nonatomic,weak)UIView *bottomView;

//遮罩
@property (nonatomic,weak)UIView *maskView;

//图片框
@property (nonatomic,weak)UIImageView *imageView;


@end

@implementation ZXScrollView

-(instancetype)initWithPicutre:(UIImage *)img BottomView:(UIView *)view{

    if (self=[super init]) {
        self.frame=[UIScreen mainScreen].bounds;
        
        //添加头部图片
        UIImageView *imageView=[UIImageView new];
        
        //设定头部图片的大小
        imageView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, IMG_H);
        
        //加载图片
        imageView.image=img;
        
        
        //将图片框加入到滚动框中
        [self addSubview:imageView];
        
        //设定滚动范围
        self.contentSize=CGSizeMake(0, IMG_H+[UIScreen mainScreen].bounds.size.height);
        
        //将图片框作为属性记录
        self.imageView=imageView;
        
        //给图片框添加遮罩
        UIView *mask=[UIView new];
        
        //设定遮罩大小
        mask.frame=imageView.bounds;
        
        //添加到图片框中
        [imageView addSubview:mask];
        
        //初始化遮罩为透明
        mask.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0 ];
        
        //将遮罩作为属性记录
        self.maskView=mask;
        
        //将传递进来的VIEW添加进来
        [self addSubview:view];
        self.bottomView=view;
        
        //将代理设置给自己
          self.delegate=self;
        
    }
    return self;
}


/**
 *  滚动框滚动的代理方法
 *
 *  @param scrollView 滚动框
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //让遮罩的大小与图片框保持一致
    self.maskView.frame=self.imageView.bounds;
    
    //判断当滚动框向下拉超过边界的时候放大图片
    if (scrollView.contentOffset.y<=0) {
        //图片框原始大小作为缩放系数的参数
        CGFloat imgH=IMG_H;
        CGFloat imgw=[UIScreen mainScreen].bounds.size.width;
        
        //新的高度为原始大小加上向下拉的距离
        CGFloat h=IMG_H-scrollView.contentOffset.y;
        
        //新的宽度与高度缩放比例相等
        CGFloat w=h/imgH*imgw;
        
        //保持下边界和横轴中心位置不变 计算x,y
        CGFloat x=(imgw-w)/2;
        CGFloat y=(imgH-h);
        
        //将计算后的frame给图片框
       // CGRect rect=CGRectMake(x, y, w, h);
        self.imageView.frame=CGRectMake(x, y, w, h);
        //  NSLog(@"%@",NSStringFromCGRect(rect));
        
        //判断当方向向上的时候让遮罩变暗
    }else if(scrollView.contentOffset.y<100&&scrollView.contentOffset.y>10){
        
        self.maskView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:scrollView.contentOffset.y*0.004];
        
        
    }
}

@end
