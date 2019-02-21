//
//  KLNProgressView.h
//  SchoolWatchParent
//
//  Created by komlin on 2018/8/9.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import <UIKit/UIKit.h>
/*方向类型*/
typedef NS_ENUM(NSInteger,NPDirectionType){
    NPDirectionTypeHorizontal=0,//水平方向
    NPDirectionTypeVertical  =1,//垂直方向
};

@interface KLNProgressView : UIImageView
/*进度条方向类型*/
@property (nonatomic,assign)NPDirectionType directionType;
/*进度*/
@property (nonatomic,weak,readonly)UIImageView *progressView;
/*进度(0到1)*/
@property (nonatomic,assign)CGFloat progress;
/*持续时间*/
@property (nonatomic,assign)NSTimeInterval duration;
/*统一设置进度条角半径*/
- (void)setProgressViewCornerRadius:(CGFloat)cornerRadius;
@end
