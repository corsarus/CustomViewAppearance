//
//  PhotoViewerTableViewController.m
//  CustomViewAppearance
//
//  Created by Catalin (iMac) on 30/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "PhotoViewerTableViewController.h"
#import "PhotoViewerPhotoDetailViewController.h"
#import "PhotoViewerLabel.h"
#import "PhotoViewerImageView.h"

@interface PhotoViewerTableViewController ()

@property (nonatomic, strong) NSArray *imagePaths;

@end

@implementation PhotoViewerTableViewController

#pragma mark - Accessors

- (NSArray *)imageURLs
{
    if (!_imagePaths) {
        _imagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:nil];
    }
    
    return _imagePaths;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    PhotoViewerLabel *title = [[PhotoViewerLabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 100.0, 44.0)];
    title.text = @"Photos";
    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = title;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageURLs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *imageFileName = [self.imagePaths[indexPath.row] lastPathComponent];
    
    PhotoViewerLabel *photoTitle = [[PhotoViewerLabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 240.0, 44.0)];
    photoTitle.text = imageFileName;
    
    [cell.contentView addSubview:photoTitle];
    
    UIImage *image = [UIImage imageWithContentsOfFile:self.imagePaths[indexPath.row]];
    CGSize thumbnailSize = [self thumbnailImageSizeForImage:image];
    PhotoViewerImageView *thumbnail = [[PhotoViewerImageView alloc] initWithFrame:CGRectMake(20.0, 4.0, thumbnailSize.width, thumbnailSize.height)];
    thumbnail.image = image;
    [cell.contentView addSubview:thumbnail];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showPhotoDetail" sender:nil];
}
	
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showPhotoDetail"]) {
        PhotoViewerPhotoDetailViewController *photoDetailViewController = (PhotoViewerPhotoDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        photoDetailViewController.photo = [UIImage imageWithContentsOfFile:self.imagePaths[selectedIndexPath.row]];
        photoDetailViewController.photoName = [self.imagePaths[selectedIndexPath.row] lastPathComponent];
    }
}

#pragma mark - Utility

- (CGSize)thumbnailImageSizeForImage:(UIImage *)image
{
    CGFloat aspectRatio = image.size.width / image.size.height;
    CGFloat thumbnailHeight = 36.0;
    CGFloat thumbnailWidth = thumbnailHeight * aspectRatio;
    
    return CGSizeMake(thumbnailWidth, thumbnailHeight);
}



@end
