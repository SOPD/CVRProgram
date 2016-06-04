//
//  ZXUIView.m
//  HeaderPictureZoomer
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "ZXUIView.h"
#define HALF_SCREEN_W ([UIScreen mainScreen].bounds.size.width/2)

@interface ZXUIView()
@property (strong, nonatomic) UIScrollView *ScrollView;
@end


@implementation ZXUIView

//图片数组setter
-(void)setPictures:(NSArray *)pictures{
    _pictures=pictures;
    
    //逆序遍历图片数组
    for (int i=(int)pictures.count-1; i>=0; i--) {
        
        //添加图片
        [self addPictureAtIndex:i Image:self.pictures[i]];
    }
    //设置滚动范围
    self.ScrollView.contentSize=CGSizeMake(HALF_SCREEN_W*self.pictures.count, 0);
    
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化滚动框
        self.ScrollView=[[UIScrollView alloc]init];
        //设置滚动框大小为屏幕一半
        self.ScrollView.frame=CGRectMake(0, 0, HALF_SCREEN_W, [UIScreen mainScreen].bounds.size.height);
        //添加滚动框
        [self addSubview:self.ScrollView];
        //设置代理
        self.ScrollView.delegate=self;
        
    
        //开启分页
        self.ScrollView.pagingEnabled=YES;
        //禁止裁剪以将子空间铺满全屏
        self.ScrollView.clipsToBounds = NO;
        
    }
    return self;
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

//修改hitTest事件 将相应传递给scrollView
    return self.ScrollView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"123");
}
/**
 *   滚动时
 *
 *  @param scrollView
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //遍历滚动框的子控件
    for (UIImageView *imgVw in scrollView.subviews) {
        
        //判断 当移动在对应图片的范围内(图片所在位置到图片向左半个屏幕)
        if (scrollView.contentOffset.x-imgVw.tag*HALF_SCREEN_W<=HALF_SCREEN_W&&scrollView.contentOffset.x-imgVw.tag*HALF_SCREEN_W>=0) {
            //保持原始X Y H不变 宽度随着滚动位置改变 图片宽度要减去图片向左位移的距离
imgVw.frame=CGRectMake(imgVw.frame.origin.x, imgVw.frame.origin.y, [UIScreen mainScreen].bounds.size.width-(scrollView.contentOffset.x-imgVw.tag*HALF_SCREEN_W), imgVw.frame.size.height);
            
        }
    }
    
}

//添加图片
-(void)addPictureAtIndex:(int)index Image:(UIImage *)img{
    //创建图片框
    UIImageView *imageVw=[UIImageView new];
    //图片框位置为半个屏幕的index倍
    CGFloat x=HALF_SCREEN_W*index;
    //设置图片宽高
    imageVw.frame=CGRectMake(x, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //设置图片
    imageVw.image=img;
    
    //设置图片填充模式
    imageVw.contentMode=UIViewContentModeScaleAspectFill;
    
    //允许图片裁剪
    imageVw.clipsToBounds=YES;
    
    //将图片所在位置作为TAG记录
    imageVw.tag=index;
    
    //添加图片
    [self.ScrollView addSubview:imageVw];
}

@end
