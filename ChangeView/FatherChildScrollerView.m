//
//  FatherChildScrollerView.m
//  CVRProgrom
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "FatherChildScrollerView.h"
#import "ChildScrollView.h"

@implementation FatherChildScrollerView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces=NO;
        
        UIView *childVw=[UIView new];
        childVw.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-205);
        childVw.backgroundColor=[UIColor greenColor];
        [self addSubview:childVw];
        
        UIView *bigVw=[UIView new];
        bigVw.frame=CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        bigVw.backgroundColor=[UIColor redColor];
        [self addSubview:bigVw];
        
        self.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
       self.pagingEnabled=YES;
        
        ChildScrollView *childScro=[[ChildScrollView alloc]init];
        childScro.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        [self addSubview:childScro];
        self.childScrollerView=childScro;
        childScro.bounces=NO;
        
        
        childScro.beginUp=^(CGFloat y){
 
            if (y>=50) {
                
                [UIView animateWithDuration:0.25 animations:^{
                    childVw.frame=CGRectMake(0, 205, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-205);
                    
                }];
            }else if(y<=-100){
                     NSLog(@"zxoule");
                [UIView animateWithDuration:0.25 animations:^{
                    childVw.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-205);
               
                }];
                
            }
        };
//        childScro.endUp=^(CGFloat y){
//
//            
//            
//            if((y<=-50)){
//            [UIView animateWithDuration:0.25 animations:^{
//                   childVw.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-205);
//            }];
//          
//            }
//        };
//        
        
        for (int i=0; i<4; i++) {
            
            UIView *view=[UIView new];
            view.frame=CGRectMake([UIScreen mainScreen].bounds.size.width *i, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height);
            view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
            [childScro addSubview:view];
            
        }
        childScro.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width *4, 0);
        childScro.pagingEnabled=YES;
        
        
        
        self.delegate=self;
        

        
    }
    return self;
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if (self.contentOffset.x<[UIScreen mainScreen].bounds.size.width) {
        
        return self.childScrollerView;
    }
    return self;


}



@end
