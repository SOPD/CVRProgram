
//
//  FatherChildScrollerView.h
//  CVRProgrom
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FatherChildScrollerView : UIScrollView<UIScrollViewDelegate>
/**
 *  主视图
 *  大小 :屏幕宽度*屏幕高度-205
 */
@property(nonatomic,weak)UIView *HomeView;
/**
 *  最右附加视图
 *  大小 :屏幕宽度*屏幕高度
 */
@property(nonatomic,weak)UIView *AttachView;

/**
 *  底部弹出视图
 *  大小 :屏幕宽度*屏幕高度-205
 */
@property(nonatomic,weak)UIView *BottomView;
/**
 *  头部滚动框的子View
 *  大小 :屏幕宽度*200
 */
@property(nonatomic,strong)NSMutableArray *headerViews;
/**
 *  创建并规定头部滚动框的子view数量
 *
 *  @param pageNumber 头部滚动框的子VIEW数
 *
 *  @return
 */
-(instancetype)initWithNumOfChildPage:(NSInteger) pageNumber;
@end
