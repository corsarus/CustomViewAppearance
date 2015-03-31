//
//  PhotoViewerLabel.m
//  CustomViewAppearance
//
//  Created by Catalin (iMac) on 30/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "PhotoViewerLabel.h"

@implementation PhotoViewerLabel

- (void)setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    self.font = [UIFont systemFontOfSize:fontSize];
}

- (void)setContentColor:(UIColor *)textColor
{
    _contentColor = textColor;
    self.textColor = textColor;
}

@end
