//
//  ViewController.m
//  XMPageController
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "JCLTtitleScrollView.h"
#import "JCLContentScrollView.h"
#import "NewViewController.h"
@interface ViewController ()<JCLScrollViewDelegate,JCLTitleDelegate>
@property(nonatomic,strong)JCLTtitleScrollView *title_view;

@property(nonatomic,strong)JCLContentScrollView *content_view;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self.view addSubview:self.title_view];
    [self.view addSubview:self.content_view];
    // Do any additional setup after loading the view, typically from a nib.
}

-(JCLTtitleScrollView *)title_view{
    
    if (!_title_view) {
        
        _title_view = [[JCLTtitleScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50) with:@[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7",@"标题8",@"标题9",@"标题10",@"标题11",@"标题12",@"标题13",@"标题14",@"标题15"]];
        _title_view.backgroundColor = [UIColor whiteColor];
        _title_view.delegate =self;
    }
    return _title_view;
}
-(JCLContentScrollView *)content_view{
    
    if (!_content_view) {
        
        _content_view = [[JCLContentScrollView alloc]initWithFrame:CGRectMake(0, 114, self.view.frame.size.width, self.view.frame.size.height-114) with:@[[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init],[[NewViewController alloc]init]] parent:self];
        _content_view.delegate = self;
        _content_view.backgroundColor = [UIColor whiteColor];
    }
    return _content_view;
}
-(void)JCLTapOffset:(NSInteger)currentIndex with:(UILabel *)currentLab{
    
    
    [self.content_view JCLContentOffsetWithIndex:currentIndex];
}
-(void)ContentPagePorgess:(CGFloat)progress with:(NSInteger)source with:(NSInteger)target{
    
    NSLog(@"--%f",progress);
    [self.title_view ChangeUnderLineFrameWithProgress:progress with:source with:target];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
