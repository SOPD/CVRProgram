//
//  ChildScrollView.h
//  CVRProgrom
//
//  Created by mac on 16/6/5.
//  Copyright © 2016年 zhaoxin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^upView)(CGFloat);
@interface ChildScrollView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic,copy)upView beginUp;
@property (nonatomic,copy)upView endUp;
@end
