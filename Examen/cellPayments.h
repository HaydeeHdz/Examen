//
//  cellPayments.h
//  Examen
//
//  Created by Haydee on 8/29/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Payments.h"
@interface cellPayments : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblNombreValue;
@property (strong, nonatomic) IBOutlet UILabel *lblPrecioValue;
@property (strong, nonatomic) IBOutlet UIImageView *imgProducto;

@end
