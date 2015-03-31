//
//  PhotoViewerLabel.h
//  CustomViewAppearance
//
//  Created by Catalin (iMac) on 30/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewerLabel : UILabel

@property (nonatomic, strong) UIColor *contentColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat fontSize UI_APPEARANCE_SELECTOR;

@end
