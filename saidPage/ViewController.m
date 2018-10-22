//
//  ViewController.m
//  saidPage
//
//  Created by jx on 2018/10/19.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "ViewController.h"
#import "LXTagsView.h"
@interface ViewController ()
@property (nonatomic,strong)UIView *redview;
@property (nonatomic,assign)BOOL show;
@property (nonatomic,strong)UIButton *but;
@property (nonatomic,strong)LXTagsView *tagsView;
@property (nonatomic,strong)NSMutableArray *Array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Array  = [NSMutableArray array];
    
    self.tagsView =[[LXTagsView alloc]init];
    self.tagsView.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.6];
    [self.view addSubview:self.tagsView];
    [self.tagsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(self.view);
    }];
    
    self.tagsView.clipsToBounds=YES;
    NSArray *array = @[@"将军百战死",@"十年磨一剑，越小越就奥数"];
    self.tagsView.dataA = array;
    
    self.tagsView.tagClick = ^(NSString *tagTitle) {
        NSLog(@"View 打印--%@",tagTitle);
    };

    [self.view layoutIfNeeded];
    
    
    
//    UIView *viewbg = [[UIView alloc]init];
//    viewbg.backgroundColor = [UIColor redColor];
//    [self.view  addSubview:viewbg];
//
//    [viewbg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.mas_equalTo(self.tagsView.mas_bottom);
//        make.height.mas_equalTo(@200);
//    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    UIView *view1 = [[UIView alloc]init];
//
//    view1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view1];
//
//    [view1 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top);
//        make.left.right.equalTo(self.view);
//        make.height.equalTo(@200);
//    }];
    CGFloat h = 200;
//    self.redview = view1;

    UIButton *but = [[UIButton alloc]init];
    but.backgroundColor = [UIColor greenColor];
    [but addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    [but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagsView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@60);
    }];
    self.but = but;
    CGFloat sizeh = [self.Array[0] floatValue];
    NSLog(@"????????????????????????????/%f????????????",sizeh);
    if (sizeh>=200) {
        _show = NO;
        but.hidden = NO;
        [self.tagsView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(@100);
        }];
    }else{
        _show = YES;
        but.hidden = YES;
    }

}
-(void)buttonClick:(UIButton *)sender{
    
    _show = !_show;
    
    if (_show) {
        NSLog(@"选中");
            [self.tagsView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo([self.Array[0] floatValue]);
            }];
    }else{
        NSLog(@"取消");
        [self.tagsView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo([self.Array[1] floatValue]);
        }];

    }
    

}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[self.tagsView class]]) {
            CGFloat h = view.frame.size.height;
            NSLog(@"+++++++++++%f+++++++++++",h);
            NSString *str = [NSString stringWithFormat:@"%f",h];
            
            if (![self.Array containsObject:str]) {
                [self.Array addObject:str];
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
