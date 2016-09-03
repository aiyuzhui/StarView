//
//  StarView.m
//
//  Created by III on 16/5/26.
//  Copyright © 2016年 霍雨霏. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"

@implementation StarView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        //创建底部灰色视图
        [self creatGrayView];
        
        //创建黄色星星视图
        [self creatYellowView];
        
        
    }
    
    return self;
    
}

- (void)creatGrayView{

    //创建灰色视图的图片
    UIImage *grayStarImage = [UIImage imageNamed:@"gray@2x.png"];
    
    //创建灰色视图
    _grayView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,grayStarImage.size.width*5,grayStarImage.size.height)];
    
    //
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayStarImage];
    
    //计算宽缩放比例
    CGFloat kScale = self.bounds.size.width/_grayView.bounds.size.width;
    
    NSLog(@"黑色%lf",kScale);
    
    //计算高缩放比例
    CGFloat gScale = self.bounds.size.height/_grayView.bounds.size.height;
    
    NSLog(@"黑色%lf",gScale);
    
    //根据比例进行缩放_grayView
    _grayView.transform = CGAffineTransformMakeScale(kScale, gScale);
    
    //将灰色视图的起点坐标设定为(0,0)就可以与父视图起点相同
    _grayView.origin = CGPointZero;
    
    //添加到星星视图显示
    [self addSubview:_grayView];
    


}

- (void)creatYellowView{

    //创建灰色视图的图片
    UIImage *yellowStarImage = [UIImage imageNamed:@"yellow@2x.png"];
    
    //创建灰色视图
    _yellowView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,yellowStarImage.size.width*5,yellowStarImage.size.height)];
    
    //
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowStarImage];
    
    //计算宽缩放比例
    CGFloat kScale = self.bounds.size.width/_yellowView.bounds.size.width;
    NSLog(@"黄色%lf",kScale);
    
    //计算高缩放比例
    CGFloat gScale = self.bounds.size.height/_yellowView.bounds.size.height;
    
    NSLog(@"黄色%lf",gScale);
    
    //根据比例进行缩放_grayView
    _yellowView.transform = CGAffineTransformMakeScale(kScale, gScale);
    
    //将灰色视图的起点坐标设定为(0,0)就可以与父视图起点相同
    _yellowView.origin = CGPointZero;

    //添加到星星视图显示
    [self addSubview:_yellowView];

    
}

- (void)setPercent:(CGFloat)percent{

    _percent = percent;
    
    //根据评分计算裁剪的比例
    _yellowView.frame = CGRectMake(0, 0, _grayView.frame.size.width * _percent / 10, _grayView.frame.size.height);
    

}
@end
