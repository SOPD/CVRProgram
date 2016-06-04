//
//  FatherChildScrollerView.m
//  CVRProgrom
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "FatherChildScrollerView.h"

@implementation FatherChildScrollerView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *bigVw=[UIView new];
        bigVw.frame=CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        bigVw.backgroundColor=[UIColor redColor];
        [self addSubview:bigVw];
        
        self.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
       self.pagingEnabled=YES;
        
        UIScrollView *childScro=[[UIScrollView alloc]init];
        childScro.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        [self addSubview:childScro];
        self.childScrollerView=childScro;
        
        
        for (int i=0; i<4; i++) {
            
            UIView *view=[UIView new];
            view.frame=CGRectMake([UIScreen mainScreen].bounds.size.width *i, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height);
            view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
            [childScro addSubview:view];
            
        }
        childScro.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width *4, 0);
        childScro.pagingEnabled=YES;
    }
    return self;
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if (self.contentOffset.x<[UIScreen mainScreen].bounds.size.width) {
        
        return self.childScrollerView;
    }
    return self;


}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",touches);


}
@end
