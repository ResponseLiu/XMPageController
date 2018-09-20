//
//  JCLContentScrollView.h
//  NBTest
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 panzihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol JCLScrollViewDelegate<NSObject>
@required
-(void)ContentPagePorgess:(CGFloat)progress with:(NSInteger)source with:(NSInteger)target;
@end
@interface JCLContentScrollView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>


-(instancetype)initWithFrame:(CGRect)frame with:(NSArray <UIViewController *>*)pages parent:(ViewController *)parent;

/**
 滚动

 @param index 下标
 */
-(void)JCLContentOffsetWithIndex:(NSInteger)index;
/**
 滚动到指定位置
 
 @param index 索引
 */
-(void)scrollToindex:(NSInteger)index;

@property(nonatomic,strong)UICollectionView *collection;

@property(nonatomic,strong)NSArray *pages;

@property(nonatomic,assign)CGFloat startContentset;

@property(nonatomic,assign)BOOL is_tap;

@property(nonatomic,weak)id<JCLScrollViewDelegate>delegate;
@end

