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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    self.gestureStartPoint= [touch locationInView:self.superview];//开始触摸
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    
    
    CGPoint currentPosition = [touch locationInView:self.superview];
    
    CGFloat deltaX = (self.gestureStartPoint.x - currentPosition.x);
    
    CGFloat deltaY = self.gestureStartPoint.y - currentPosition.y;
     NSLog(@"%f,%f",deltaX,deltaY);
    if (deltaY>0) {
        self.beginUp(deltaY);
        
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    
    
    CGPoint currentPosition = [touch locationInView:self.superview];
    
    CGFloat deltaX = (self.gestureStartPoint.x - currentPosition.x);
    
    CGFloat deltaY = self.gestureStartPoint.y - currentPosition.y;
    NSLog(@"end--%f,%f",deltaX,deltaY);
   
        
        self.endUp(deltaY);
    

}

@end
