//
//  FatherChildScrollerView.m
//  CVRProgrom
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "FatherChildScrollerView.h"
#import "ChildScrollView.h"

@interface FatherChildScrollerView ()
@property(nonatomic,strong)UIScrollView *childScrollerView;

@end
@implementation FatherChildScrollerView

/**
 *  重写默认初始化方法  给四个子view
 *
 *  @return
 */
- (instancetype)init
{
     self = [super init];
    return  [self initWithNumOfChildPage:4];
}

/**
 *  懒加载
 *
 *
 */
-(NSMutableArray *)headerViews{
    if (_headerViews==nil) {
        _headerViews=[NSMutableArray array];
    }
    return _headerViews;
}
/**
 *  初始化方法
 *
 *  @param pageNumber 子滚动框的页数 
 *
 *  @return
 */
-(instancetype)initWithNumOfChildPage:(NSInteger) pageNumber{
    if (self=[super init]) {
        
        //添加主页视图
        UIView *home=[[UIView alloc]init];
        //对外接口
        self.HomeView=home;
        //布局
        home.frame=CGRectMake(0,
                              205,
                              [UIScreen mainScreen].bounds.size.width,
                              [UIScreen mainScreen].bounds.size.height-205);
        home.backgroundColor=[UIColor darkGrayColor];
        [self addSubview:home];
        
        
        //添加底部弹出View
        UIView *childVw=[UIView new];
        
        //添加公开接口
        self.BottomView=childVw;
        
        //底部弹出VIEW先放在屏幕以下
        childVw.frame=CGRectMake(0,
                                 [UIScreen mainScreen].bounds.size.height,
                                 [UIScreen mainScreen].bounds.size.width,
                                 [UIScreen mainScreen].bounds.size.height-205);
        childVw.backgroundColor=[UIColor greenColor];
        [self addSubview:childVw];
        

        //添加子滚动框
        ChildScrollView *childScro=[[ChildScrollView alloc]init];
        
        //放置子滚动框
        childScro.frame=CGRectMake(0,
                                   0,
                                   [UIScreen mainScreen].bounds.size.width,
                                   200);
        [self addSubview:childScro];
        
        //记录为属性
        self.childScrollerView=childScro;
        
        //取消弹簧效果
        childScro.bounces=NO;
        
        //子滚动框发生上拉下拉的回调
        childScro.beginUp=^(CGFloat y){
            
            //上拉超过一定范围弹出底部视图
            if (y>=50) {
                
                [UIView animateWithDuration:0.25 animations:^{
                    childVw.frame=CGRectMake(0,
                                             205,
                                             [UIScreen mainScreen].bounds.size.width,
                                             [UIScreen mainScreen].bounds.size.height-205);
                    
                }];
                //下拉一定范围缩回底部视图
            }else if(y<=-60){
                NSLog(@"zxoule");
                [UIView animateWithDuration:0.25 animations:^{
                    childVw.frame=CGRectMake(0,
                                             [UIScreen mainScreen].bounds.size.height,
                                             [UIScreen mainScreen].bounds.size.width,
                                             [UIScreen mainScreen].bounds.size.height-205);
                    
                }];
                
            }
        };
        
        
        //添加子滚动框额view
        for (int i=0; i<pageNumber; i++) {
            
            //创建子滚动框的view
            UIView *view=[UIView new];
            //添加进公开的接口
            [self.headerViews addObject:view];
            //布局子滚动框
            view.frame=CGRectMake([UIScreen mainScreen].bounds.size.width *i,
                                  0,
                                  [UIScreen mainScreen].bounds.size.width ,
                                  200);
            
            
            view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
            
            [childScro addSubview:view];
            
        }
        //计算子滚动框的滚动范围
        childScro.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width * pageNumber, 0);
        //关闭弹簧效果
        childScro.pagingEnabled=YES;
        
    }
    return self;

}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //取消弹簧效果
        self.bounces=NO;
        
        //添加最右视图
        UIView *bigVw=[UIView new];
        
        //添加最右视图对外接口
        self.AttachView=bigVw;
        
        //布局最右视图
        bigVw.frame=CGRectMake([UIScreen mainScreen].bounds.size.width,
                               0,
                               [UIScreen mainScreen].bounds.size.width,
                               [UIScreen mainScreen].bounds.size.height);
        
        bigVw.backgroundColor=[UIColor redColor];
        
        [self addSubview:bigVw];
        
        //设置自身的滚动范围为二倍屏幕宽度
        self.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
        //开启分页
       self.pagingEnabled=YES;

        self.delegate=self;
        

        
    }
    return self;
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    //响应链条传递   在且到附加视图后让自己响应触摸事件  否则让子滚动框响应
    if (self.contentOffset.x<[UIScreen mainScreen].bounds.size.width) {
        
        return self.childScrollerView;
    }
    return self;


}



@end
