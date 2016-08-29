//
//  MapResults.m
//  Examen
//
//  Created by Haydee on 8/28/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import "MapResults.h"

#define nURLImage @"http://openweathermap.org/img/w/";

@interface MapResults ()

@end

@implementation MapResults

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblNameValue.text    = self.lblName;
    self.lblTempMaxValue.text = self.lblTempMa;
    self.lblTempMinValue.text = self.lblTempMi;
    self.lblHumedadValue.text = self.lblHum;
    
    NSString *urlImg = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png",self.img];
    
    //NSURL *imageURL = [NSURL URLWithString:@"http://openweathermap.org/img/w/10d.png"];
    NSURL *imageURL = [NSURL URLWithString:urlImg];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *imagen = [UIImage imageWithData:imageData];
    
    [self.imgIcon setImage:imagen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
