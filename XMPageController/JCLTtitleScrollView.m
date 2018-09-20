//
//  JCLTtitleScrollView.m
//  NBTest
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 panzihao. All rights reserved.
//

#import "JCLTtitleScrollView.h"
#define RGB(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface JCLTtitleScrollView ()

@property(nonatomic,strong)NSMutableArray <UILabel *>*titleLabes;

@property(nonatomic,assign)NSInteger currentIndex;

@property(nonatomic,strong)UIView *under_line;



@end
@implementation JCLTtitleScrollView

-(instancetype)initWithFrame:(CGRect)frame with:(NSArray <NSString *>*)titles{
    
    if (self = [super initWithFrame:frame]) {
        
        self.titles = titles;
        [self setUI:titles];
       
    }
    return self;
}
-(void)setUI:(NSArray <NSString *>*)titles{
   
    [self addSubview:self.scrollview];
   
    for (int i=0; i<titles.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*self.bounds.size.width/5, 0, self.bounds.size.width/5, 48)];
        label.text = titles[i];
        label.tag = i;
        label.textAlignment = 1;
        label.font = [UIFont systemFontOfSize:16];
        label.userInteractionEnabled = YES;
        label.textColor = i!=0? RGB(85.0, 85.0, 85.0): RGB(255.0, 128.0, 0.0);
        [self.scrollview addSubview:label];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemClick:)];
        [label addGestureRecognizer:tap];
        [self.titleLabes addObject:label];
         self.scrollview.contentSize = CGSizeMake(CGRectGetMaxX(label.frame), 0);
    }
   
    [self.scrollview addSubview:self.under_line];
    
}
-(void)setUnder_lineColor:(UIColor *)under_lineColor{
    
    _under_lineColor = under_lineColor;
    self.under_line.backgroundColor = _under_lineColor;
    
}
-(NSMutableArray *)titleLabes{
    
    if (!_titleLabes) {
        
        _titleLabes = @[].mutableCopy;
    }
    return _titleLabes;
}
-(UIScrollView *)scrollview{
    
    if (!_scrollview) {
        
        _scrollview = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollview.scrollsToTop = NO;
        _scrollview.bounces = NO;
        _scrollview.showsHorizontalScrollIndicator = false;
    }
    
    return _scrollview;
}
-(UIView *)under_line{
    
    if (!_under_line) {
        
        _under_line = [[UIView alloc]initWithFrame:CGRectMake(0, 48, self.bounds.size.width/5, 2)];
        _under_line.backgroundColor = [UIColor redColor];
    }
    
    return _under_line;
}
-(void)itemClick:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag==self.currentIndex) {
        return;
    }
    UILabel *tap_label = (UILabel *)tap.view;
    UILabel *old_label = self.titleLabes[self.currentIndex];
   
    old_label.textColor =  RGB(85.0, 85.0, 85.0);;
    tap_label.textColor = RGB(255.0, 128.0, 0.0);
   
    if ([self.delegate respondsToSelector:@selector(JCLTapOffset:with:)]) {
        
        [self.delegate JCLTapOffset:tap_label.tag with:tap_label];
    }
    
     self.currentIndex = tap.view.tag;
     [self titleContentOffset];
    [UIView animateWithDuration:.2 animations:^{
        
        self.under_line.frame=CGRectMake(self.currentIndex*self.bounds.size.width/5, 48, self.bounds.size.width/5, 2);
    }];
}
-(void)titleContentOffset{
    
    UILabel *tap_label = self.titleLabes[self.currentIndex];
    CGFloat maxOffset =  self.scrollview.contentSize.width - self.bounds.size.width;
    CGFloat offset = tap_label.center.x - self.frame.size.width/2;
    if (offset<0) {
        
        offset = 0;
    }
    if (offset>maxOffset) {
        
        offset = maxOffset;
    }
    [self.scrollview setContentOffset:CGPointMake(offset, 0) animated:YES];
    
}
-(void)ChangeUnderLineFrameWithProgress:(CGFloat)progrss with:(NSInteger)source with:(NSInteger)target{
    
    NSLog(@"%d  %d",source,target);
    UILabel *source_lab = self.titleLabes[source];
    UILabel *target_lab = self.titleLabes[target];
    source_lab.textColor = RGB(85.0*progrss, 85.0*progrss, 85.0*progrss);
    target_lab.textColor = RGB(255.0*progrss, 128.0*progrss, 0.0*progrss);
    CGFloat move_distance = target_lab.frame.origin.x - source_lab.frame.origin.x;
    self.under_line.frame=CGRectMake(source_lab.frame.origin.x+move_distance*progrss, 48, self.bounds.size.width/5, 2);
    self.currentIndex = target;
    [self titleContentOffset];
}
-(void)scrollToindex:(NSInteger)index{
    
    UILabel *target_lab = self.titleLabes[index];
    
    target_lab.textColor = RGB(255.0, 128.0, 0.0);
    self.currentIndex = index;
    [self titleContentOffset];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
