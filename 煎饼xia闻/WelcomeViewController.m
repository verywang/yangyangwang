//
//  customViewController.m
//  testWelcomePages
//
//  Created by tarena on 15/12/14.
//  Copyright © 2015年 Shaw. All rights reserved.
//

#import "WelcomeViewController.h"
#import "Masonry.h"
#import "IFTTTJazzHands.h"

#define CURRENT_DEVICE 6

#define NUMBER_OF_PAGES 4

@interface WelcomeViewController  ()
@property (nonatomic, strong) UIImageView *firstPageIV;
@property (nonatomic, strong) UIImageView *secondPageIV;
@property (nonatomic, strong) UIImageView *thirdPageIV;
@property (nonatomic, strong) UIImageView *fourthPageIV;


@property (nonatomic, strong) UILabel *firstLabel;
@property (strong, nonatomic) UILabel *secondLabel;
@property (strong, nonatomic) UILabel *thirdLabel;
@property (strong, nonatomic) UILabel *fourthLabel;


@property (nonatomic, strong) UIView *backgroundView;


@property (strong, nonatomic) UIImageView *dotImageView;
@property (nonatomic, strong) UIView *dotBackgroundView;


@end

@implementation WelcomeViewController


- (NSUInteger)numberOfPages
{
    
    return NUMBER_OF_PAGES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self configureViews];
    [self configureAnimations];
    

}

- (void)configureViews
{
    
    self.backgroundView = [UIView new];
    self.backgroundView.backgroundColor = [UIColor colorWithRed:243.f/255.f green:141.f/255.f blue:81.f/255.f alpha:1.f];
    [self.contentView addSubview:self.backgroundView];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    self.firstPageIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wel1"]];
    self.secondPageIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wel2"]];
    self.thirdPageIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wel3"]];
    self.fourthPageIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wel4"]];
    
    [self.contentView addSubview:self.firstPageIV];
    [self.contentView addSubview:self.secondPageIV];
    [self.contentView addSubview:self.thirdPageIV];
    [self.contentView addSubview:self.fourthPageIV];
    
    
    
    self.firstLabel = [UILabel new];
    self.secondLabel = [UILabel new];
    self.thirdLabel = [UILabel new];
    self.fourthLabel = [UILabel new];
    
    [self.contentView addSubview:self.firstLabel];
    [self.contentView addSubview:self.secondLabel];
    [self.contentView addSubview:self.thirdLabel];
    [self.contentView addSubview:self.fourthLabel];
    
    
    
    self.dotBackgroundView = [UIView new];
    
    [self.contentView addSubview:self.dotBackgroundView];
    
    [self configDotBackgroundView];
}

- (void)configureAnimations
{
    [self configBackGroundColorAnimation];
    
    
    [self configFirstPageAnimation];
    [self configSecondPageAnimation];
    [self configThirdPageAnimation];
    [self configFourthPageAnimation];
    
    
    
    
}

- (void)configDotBackgroundView
{
    [self.dotBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(147.25);
        if (CURRENT_DEVICE == 5) {
            make.width.equalTo(@110);
            make.height.equalTo(@20);
            make.centerY.mas_equalTo(self.contentView).multipliedBy(1.6);
        } else if (CURRENT_DEVICE == 6) {

            make.width.equalTo(@116);
            make.height.equalTo(@26);
            make.centerY.mas_equalTo(self.contentView).multipliedBy(1.55);
        } else if (CURRENT_DEVICE == 7) {
        
            make.width.equalTo(@120);
            make.height.equalTo(@30);
            make.centerY.mas_equalTo(self.contentView).multipliedBy(1.53);
        } else {
        
            make.width.equalTo(@100);
            make.height.equalTo(@16);
            make.centerY.mas_equalTo(self.contentView).multipliedBy(1.5);
        }
        NSLog(@"self.firstPageIV%g", self.firstPageIV.center.x);

    }];

    
    [self keepView:self.dotBackgroundView onPages:@[@(0), @(1), @(2)]];
    
    for (int i = 0; i < 4; i++) {
        self.dotImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unselect点"]];
        [self.dotBackgroundView addSubview:self.dotImageView];
        self.dotImageView.tag = i + 100;
        [self.dotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (CURRENT_DEVICE == 5) {
                make.width.height.equalTo(@16);
                make.left.equalTo(self.dotBackgroundView).offset(30*i);
            } else if (CURRENT_DEVICE == 6) {
                make.width.height.equalTo(@17);
                make.left.equalTo(self.dotBackgroundView).offset(30*i);
            } else if (CURRENT_DEVICE == 7) {
                make.width.height.equalTo(@18);
                make.left.equalTo(self.dotBackgroundView).offset(30*i);
            } else {
                make.width.height.equalTo(@14);
                make.left.equalTo(self.dotBackgroundView).offset(30*i);
            }
            
            
            make.centerY.equalTo(self.dotBackgroundView.mas_centerY);
        }];
        
    }
}


- (void)configDotAnimationInNumberofPage:(NSInteger)num
{
    self.dotImageView = [self.dotBackgroundView viewWithTag:num+100];
    IFTTTHideAnimation *ani = [IFTTTHideAnimation animationWithView:self.dotImageView hideAt:num];
    [self.animator addAnimation:ani];
}

- (void)configBackGroundColorAnimation
{
    [self keepView:self.backgroundView onPages:@[@(0), @(1), @(2), @(3)]];
    IFTTTBackgroundColorAnimation *circleColorAnimation = [IFTTTBackgroundColorAnimation animationWithView:self.backgroundView];
    [circleColorAnimation addKeyframeForTime:0 color:[UIColor colorWithRed:243.f/255.f green:141.f/255.f blue:81.f/255.f alpha:1.f]];
    [circleColorAnimation addKeyframeForTime:1 color:[UIColor colorWithRed:163.f/255.f green:105.f/255.f blue:248.f/255.f alpha:1.f]];
    [circleColorAnimation addKeyframeForTime:2 color:[UIColor colorWithRed:62.f/255.f green:199.f/255.f blue:158.f/255.f alpha:1.f]];
    [circleColorAnimation addKeyframeForTime:3 color:[UIColor colorWithRed:243.f/255.f green:174.f/255.f blue:53.f/255.f alpha:1.f]];
    [self.animator addAnimation:circleColorAnimation];
    

}

- (void)configFirstPageAnimation
{
    [self configViewInNumberofPage:0 withPageImageView:self.firstPageIV];
    
    [self configLabelInNumberofPage:0 withTextLabel:self.firstLabel withUpText:@"Weather" andDownText:@"关注天气    安全出门"];
    
    [self configDotAnimationInNumberofPage:0];
}

- (void)configSecondPageAnimation
{
    [self configViewInNumberofPage:1 withPageImageView:self.secondPageIV];
    
    [self configLabelInNumberofPage:1 withTextLabel:self.secondLabel withUpText:@"Constellation" andDownText:@"查看运程    不再求人"];
    
    [self configDotAnimationInNumberofPage:1];
}
- (void)configThirdPageAnimation
{
    [self configViewInNumberofPage:2 withPageImageView:self.thirdPageIV];
    
    [self configLabelInNumberofPage:2 withTextLabel:self.thirdLabel withUpText:@"News" andDownText:@"最新资讯    煎饼xia闻"];
    
    [self configDotAnimationInNumberofPage:2];
}
- (void)configFourthPageAnimation
{
    [self configViewInNumberofPage:3 withPageImageView:self.fourthPageIV];
    [self configLabelInNumberofPage:3 withTextLabel:self.fourthLabel withUpText:@"Life" andDownText:@"运单、归属    期待您的查询"];
    
    [self configStartBtn];
}

- (void)configStartBtn
{
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"立即体验"] forState:UIControlStateNormal];
    [self.contentView addSubview:startBtn];
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourthPageIV.mas_bottom).offset(100);
        make.centerX.equalTo(self.fourthPageIV);
        
        if (CURRENT_DEVICE == 5) {
            make.width.equalTo(@120);
            make.height.equalTo(@36);
        } else if (CURRENT_DEVICE == 6) {
            make.width.equalTo(@160);
            make.height.equalTo(@46);
        } else if (CURRENT_DEVICE == 7) {
            make.width.equalTo(@200);
            make.height.equalTo(@56);
        } else {
            make.width.equalTo(@80);
            make.height.equalTo(@26);
        }
        
    }];
    startBtn.showsTouchWhenHighlighted = YES;
    [startBtn addTarget:self action:@selector(clickStartBtn:) forControlEvents:UIControlEventTouchUpInside];
}
//点击进入主界面
- (void)clickStartBtn:(UIButton *)sender
{
    
    //1 创建tab bar控制器
    TabBarController *tabBarController = [[TabBarController alloc]init];
    //拿到window对象
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    //更改window对象的根视图控制器
    window.rootViewController = tabBarController;

    
    
}

- (void)configViewInNumberofPage:(NSInteger)num withPageImageView:(UIImageView*)pageIV
{
    int allPagesNum = NUMBER_OF_PAGES;
    CGFloat centerX = 1.f/allPagesNum+num*2.f/allPagesNum;
    [pageIV mas_makeConstraints:^(MASConstraintMaker *make) {
        /** 圆形图片在视图中Y轴的位置,1为中心,小于1偏上*/
        make.centerY.mas_equalTo(self.contentView).multipliedBy(0.8);
        make.centerX.mas_equalTo(self.contentView.mas_centerX).multipliedBy(centerX);
        /** 圆形图片的宽高*/
        if (CURRENT_DEVICE == 5) {
            make.width.mas_equalTo(225);
        } else if (CURRENT_DEVICE == 6) {
            make.width.mas_equalTo(250);
        } else if (CURRENT_DEVICE == 7) {
            make.width.mas_equalTo(275);
        } else {
            make.width.mas_equalTo(200);
        }
        make.height.mas_equalTo(pageIV.mas_width);
    }];
    
    [self configImageViewRotateAnimationInTextImageView:pageIV withNumberOfPage:num];
    
    
}

- (void)configLabelInNumberofPage:(NSInteger)num withTextLabel:(UILabel *)label withUpText:(NSString *)upText andDownText:(NSString *)downText
{
    int allPagesNum = NUMBER_OF_PAGES;
    CGFloat centerX = 1.f/allPagesNum+num*2.f/allPagesNum;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        /** 标签在视图中Y轴的位置,1为中心,小于1偏上*/
        
        make.centerY.mas_equalTo(self.firstPageIV).multipliedBy(0.35);
        make.centerX.mas_equalTo(self.contentView.mas_centerX).multipliedBy(centerX);
        /** 标签的宽高*/
        if (CURRENT_DEVICE == 5) {
            make.height.equalTo(@40);
            make.width.equalTo(@200);
        } else if (CURRENT_DEVICE == 6) {
            make.height.equalTo(@50);
            make.width.mas_equalTo(220);
        } else if (CURRENT_DEVICE == 7) {
            make.height.equalTo(@60);
            make.width.mas_equalTo(240);
        } else {
            make.height.equalTo(@30);
            make.width.mas_equalTo(180);
        }
    }];
    switch (num) {
        case 0:
            label.backgroundColor = [UIColor colorWithRed:212.f/255.f green:73.f/255.f blue:28.f/255.f alpha:.6f];
            break;
        case 1:
            label.backgroundColor = [UIColor colorWithRed:120.f/255.f green:67.f/255.f blue:199.f/255.f alpha:.6f];
            break;
        case 2:
            label.backgroundColor = [UIColor colorWithRed:43.f/255.f green:155.f/255.f blue:120.f/255.f alpha:.6f];
            break;
        case 3:
            label.backgroundColor = [UIColor colorWithRed:188.f/255.f green:133.f/255.f blue:37.f/255.f alpha:.6f];
            break;
    }
    
    //    label.alpha = 0.9;
    label.text = upText;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    if (CURRENT_DEVICE == 5) {
        label.font = [UIFont fontWithName:@"Chalkduster" size:20.f];
    } else if (CURRENT_DEVICE == 6) {
        label.font = [UIFont fontWithName:@"Chalkduster" size:24.f];
    } else if (CURRENT_DEVICE == 7) {
        label.font = [UIFont fontWithName:@"Chalkduster" size:28.f];
    } else {
        label.font = [UIFont fontWithName:@"Chalkduster" size:16.f];
    }
    
    [self.contentView addSubview:label];
    [self configTextScaleAnimationWithLabel:label withNumberOfPage:num];
    
    UILabel *textLabel = [UILabel new];
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        /** 标签在视图中Y轴的位置,1为中心,小于1偏上*/
        
        make.centerY.mas_equalTo(self.firstPageIV).multipliedBy(1.65);
        make.centerX.mas_equalTo(self.contentView.mas_centerX).multipliedBy(centerX);
        /** 标签的宽高*/
        if (CURRENT_DEVICE == 5) {
            make.height.equalTo(@30);
            
        } else if (CURRENT_DEVICE == 6){
            make.height.equalTo(@45);
            
        } else if (CURRENT_DEVICE == 7) {
            make.height.equalTo(@60);
        } else {
            make.height.equalTo(@25);
        }
    }];
    textLabel.text = downText;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    if (CURRENT_DEVICE == 5) {
        textLabel.font = [UIFont systemFontOfSize:20.f];
    } else if (CURRENT_DEVICE == 6){
        textLabel.font = [UIFont systemFontOfSize:22.f];
    } else if (CURRENT_DEVICE == 7) {
        textLabel.font = [UIFont systemFontOfSize:25.f];
    } else {
        textLabel.font = [UIFont systemFontOfSize:17.f];
    }
    
    
}

- (void)configTextScaleAnimationWithLabel:(UILabel *)label withNumberOfPage:(NSUInteger)num
{
    
    CGFloat fisrtKeyTime = num-.5f;
    CGFloat lastKeyTime = num+.5f;
    IFTTTScaleAnimation *scaleAnimation = [IFTTTScaleAnimation animationWithView:label];
    [scaleAnimation addKeyframeForTime:fisrtKeyTime scale:0.001f withEasingFunction:IFTTTEasingFunctionEaseInCubic];
    [scaleAnimation addKeyframeForTime:num scale:1 withEasingFunction:IFTTTEasingFunctionEaseInCubic];
    [scaleAnimation addKeyframeForTime:lastKeyTime scale:0.25f withEasingFunction:IFTTTEasingFunctionEaseInCubic];
    [self.animator addAnimation:scaleAnimation];
}

- (void)configImageViewRotateAnimationInTextImageView:(UIImageView *)pageIV withNumberOfPage:(NSUInteger)num
{
    CGFloat fisrtKeyTime = num-1.f;
    CGFloat lastKeyTime = num+1.f;
    IFTTTRotationAnimation *rotationAnimation = [IFTTTRotationAnimation animationWithView:pageIV];
    [rotationAnimation addKeyframeForTime:fisrtKeyTime rotation:150];
    [rotationAnimation addKeyframeForTime:num rotation:0];
    [rotationAnimation addKeyframeForTime:lastKeyTime rotation:-150];
    [self.animator addAnimation:rotationAnimation];
}






@end
