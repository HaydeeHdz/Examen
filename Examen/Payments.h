//
//  Payments.h
//  Examen
//
//  Created by Haydee on 8/29/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellPayments.h"
#import "Process.h"

@interface Payments : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tblPayments;
@property int index;
@property int bntRow;
-(void)callsegue:(int)index;

@end
