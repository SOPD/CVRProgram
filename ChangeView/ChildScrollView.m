//
//  ChildScrollView.m
//  CVRProgrom
//
//  Created by mac on 16/6/5.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import "ChildScrollView.h"

@interface ChildScrollView()

@property (nonatomic,assign)CGPoint gestureStartPoint;


@end

@implementation ChildScrollView
- (instancetype)init
{
    self = [super init];
    if (self) {
    
        self.delegate=self;
    }
    return self;
}

//点击开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    //获取touch
    UITouch *touch = [touches anyObject];
    //开始触摸时在父view中的位置
    self.gestureStartPoint= [touch locationInView:self.superview];
    
}
//触摸移动中
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取touch
    UITouch *touch=[touches anyObject];
    
    //获取当前所在位置
    CGPoint currentPosition = [touch locationInView:self.superview];
    
    //计算x轴相对父view的位移
    CGFloat deltaX = (self.gestureStartPoint.x - currentPosition.x);
    
    //计算Y轴相对父view的位移
    CGFloat deltaY = self.gestureStartPoint.y - currentPosition.y;
     NSLog(@"%f,%f",deltaX,deltaY);
  
    //回调代码块  传递Y轴位移
        self.beginUp(deltaY);
        
    
}


@end
