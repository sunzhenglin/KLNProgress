//
//  KLNProgressView.m
//  SchoolWatchParent
//
//  Created by komlin on 2018/8/9.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import "KLNProgressView.h"
@implementation KLNProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        /*progress*/
        UIImageView *progressView=[[UIImageView alloc]init];
        /*添加视图*/
        [self addSubview:progressView];
        /*赋值*/
        _progressView=progressView;
        /*配置*/
        [self configuration];
    }
    return self;
}

- (void)configuration{
    /*配置*/
    self.backgroundColor=[UIColor colorWithRed:243/255.f green:243/255.f blue:243/255.f alpha:1.f];
    self.progressView.backgroundColor=[UIColor colorWithRed:115/255.f green:196/255.f blue:255/255.f alpha:1.f];
    self.directionType=NPDirectionTypeHorizontal;
    self.progress=0.0;
    self.duration=1.0;
    
}

- (void)setDirectionType:(NPDirectionType)directionType{
    _directionType=directionType;
    if (_directionType==NPDirectionTypeHorizontal) {
        [self setProgressViewCornerRadius:15];
    }else if (_directionType==NPDirectionTypeVertical){
        [self setProgressViewCornerRadius:5];
    }
}

/*设置进度条角半径*/
- (void)setProgressViewCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius=cornerRadius;
    self.layer.masksToBounds=YES;
    self.progressView.layer.cornerRadius=cornerRadius;
    self.progressView.layer.masksToBounds=YES;
}

/*加载数据*/
- (void)reloadData{
    CGFloat viewW=self.frame.size.width;
    CGFloat viewH=self.frame.size.height;
    __weak typeof(self) weakSelf=self;
    __block CGFloat progressViewX=0;
    __block CGFloat progressViewY=0;
    __block CGFloat progressViewH=0;
    __block CGFloat progressViewW=0;
    if (self.directionType==NPDirectionTypeHorizontal) {
        progressViewX=0;
        progressViewY=0;
        progressViewH=viewH;
        progressViewW=0;
        self.progressView.frame=CGRectMake(progressViewX, progressViewY, progressViewW, progressViewH);
        [UIView animateWithDuration:self.duration animations:^{
            progressViewW=viewW*weakSelf.progress;
            weakSelf.progressView.frame=CGRectMake(progressViewX, progressViewY, progressViewW, progressViewH);
        }];
    }else if (self.directionType==NPDirectionTypeVertical){
        progressViewX=0;
        progressViewW=viewW;
        progressViewH=0;
         progressViewY=viewH-progressViewH;
        self.progressView.frame=CGRectMake(progressViewX, progressViewY, progressViewW, progressViewH);
        [UIView animateWithDuration:self.duration animations:^{
            progressViewH=viewH*weakSelf.progress;
            progressViewY=viewH-progressViewH;
            weakSelf.progressView.frame=CGRectMake(progressViewX, progressViewY, progressViewW, progressViewH);
        }];
    }
}

- (void)setProgress:(CGFloat)progress{
    if (progress>=1.f) {
        progress=1.f;
    }else if(progress<=0.f) {
        progress=0.f;
    }
    _progress=progress;
    [self reloadData];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
