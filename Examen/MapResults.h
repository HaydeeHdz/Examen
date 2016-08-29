//
//  MapResults.h
//  Examen
//
//  Created by Haydee on 8/28/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapResults : UIViewController
@property NSString *lblName;
@property NSString *lblTempMi;
@property NSString *lblTempMa;
@property NSString *lblHum;
@property NSString *img;

@property (strong, nonatomic) IBOutlet UILabel *lblTempMaxValue;
@property (strong, nonatomic) IBOutlet UILabel *lblHumedadValue;
@property (strong, nonatomic) IBOutlet UILabel *lblTempMinValue;
@property (strong, nonatomic) IBOutlet UILabel *lblNameValue;
@property (strong, nonatomic) IBOutlet UIImageView *imgIcon;


@end
