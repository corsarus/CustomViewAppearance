//
//  PhotoViewerPhotoDetailViewController.m
//  CustomViewAppearance
//
//  Created by admin on 30/03/15.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "PhotoViewerPhotoDetailViewController.h"
#import "PhotoViewerImageView.h"
#import "PhotoViewerCaptionTextField.h"

@interface PhotoViewerPhotoDetailViewController ()

@property (weak, nonatomic) IBOutlet PhotoViewerImageView *photoView;
@property (weak, nonatomic) IBOutlet PhotoViewerCaptionTextField *photoCaption;

@end

@implementation PhotoViewerPhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoView.image = self.photo;
    self.photoCaption.text = self.photoName;
}

@end
