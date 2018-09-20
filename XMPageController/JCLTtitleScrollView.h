//
//  JCLTtitleScrollView.h
//  NBTest
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 panzihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JCLTitleDelegate <NSObject>

@required
-(void)JCLTapOffset:(NSInteger)currentIndex with:(UILabel *)currentLab;

@end

@interface JCLTtitleScrollView : UIView

@property(nonatomic,strong)UIScrollView *scrollview;

@property(nonatomic,strong)NSArray <NSString *>*titles;

@property(nonatomic,strong)UIColor *under_lineColor;

@property(nonatomic,weak)id<JCLTitleDelegate>delegate;
/**
   初始化数组

 @param frame frame
 @param titles 标题数组
 @return  object
 */
-(instancetype)initWithFrame:(CGRect)frame with:(NSArray *)titles;

/**
 改变下标

 @param progrss 进度
 @param source  源label
 @param target  目标label
 */
-(void)ChangeUnderLineFrameWithProgress:(CGFloat)progrss with:(NSInteger)source with:(NSInteger)target;

/**
 标题偏移

 @param tap_label tapClick
 */
-(void)titleContentOffset;

/**
 滚动到指定位置

 @param index 索引
 */
-(void)scrollToindex:(NSInteger)index;

@end
