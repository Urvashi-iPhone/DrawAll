//
//  ViewController.m
//  DrawRect
//
//  Created by Tecksky Techonologies on 3/21/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+PolygonMasking.h"
#import "UIBezierPath+ZEPolygon.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *maskedImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.png"]];
    
    UIBezierPath *nonagon = [UIBezierPath bezierPathWithPolygonInRect:maskedImageView.frame numberOfSides:9];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = nonagon.CGPath;
    
    maskedImageView.layer.mask = shapeLayer;
    
    [self.view addSubview:maskedImageView];
    
    UIImage *maskedImage = [[UIImage imageNamed:@"image.png"] imageMaskedWithPolygonWithNumberOfSides:3];
    UIImageView *normalImageView = [[UIImageView alloc] initWithImage:maskedImage];
    CGRect imageViewFrame = normalImageView.frame;
    imageViewFrame = CGRectOffset(imageViewFrame, 0, 240);
    normalImageView.frame = imageViewFrame;
   // [self.view addSubview:normalImageView];
    
    
   [_btn setBackgroundImage:maskedImage forState:UIControlStateNormal];
}


@end
