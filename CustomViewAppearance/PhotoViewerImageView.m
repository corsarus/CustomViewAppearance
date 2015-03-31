//
//  PhotoViewerImageView.m
//  CustomViewAppearance
//
//  Created by Catalin (iMac) on 30/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "PhotoViewerImageView.h"

@implementation PhotoViewerImageView

- (void)setAddShadow:(BOOL)addShadow
{
    if (addShadow) {
        self.layer.shadowOffset = CGSizeMake(0.0, 4.0);
        self.layer.shadowOpacity = 0.8;
    }
}

@end
