//
//  Process.h
//  Examen
//
//  Created by Haydee on 8/29/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Payments.h"
#import "PayPalMobile.h"

@interface Process : UIViewController<PayPalPaymentDelegate>
@property int articulo;
@property (strong, nonatomic) IBOutlet UIImageView *imgProducto;
@property (strong, nonatomic) IBOutlet UILabel *lblProductoValue;
@property (strong, nonatomic) IBOutlet UILabel *lblPrecioValue;
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;

@end
