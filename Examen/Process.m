//
//  Process.m
//  Examen
//
//  Created by Haydee on 8/29/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import "Process.h"

@interface Process ()

@end

@implementation Process

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    if (self.articulo == 0)
    {
        self.imgProducto.image = [UIImage imageNamed: @"blusa.jpg"];
        self.lblProductoValue.text = @"Blusa para dama";
        self.lblPrecioValue.text = @"220.00";
    }
    else if (self.articulo == 1)
    {
        self.imgProducto.image = [UIImage imageNamed: @"short.jpg"];
        self.lblProductoValue.text = @"Short";
        self.lblPrecioValue.text = @"180.00";
    }
    else if (self.articulo == 2)
    {
        self.imgProducto.image = [UIImage imageNamed: @"vestidoLargo.jpg"];
        self.lblProductoValue.text = @"Vestido de Noche";
        self.lblPrecioValue.text = @"490.00";
    }
    else if (self.articulo == 3)
    {
        self.imgProducto.image = [UIImage imageNamed: @"abrigo.jpg"];
        self.lblProductoValue.text = @"Abrigo";
        self.lblPrecioValue.text = @"880.00";
    }
    else if (self.articulo == 4)
    {
        self.imgProducto.image = [UIImage imageNamed: @"chamarra.jpg"];
        self.lblProductoValue.text = @"Chamarra";
        self.lblPrecioValue.text = @"750.00";
    }
    else if (self.articulo == 5)
    {
        self.imgProducto.image = [UIImage imageNamed: @"falda.jpg"];
        self.lblProductoValue.text = @"Falda";
        self.lblPrecioValue.text = @"230.00";
    }
    else if (self.articulo == 6)
    {
        self.imgProducto.image = [UIImage imageNamed: @"jeans.jpg"];
        self.lblProductoValue.text = @"Jeans";
        self.lblPrecioValue.text = @"350.00";
    }
    else if (self.articulo == 7)
    {
        self.imgProducto.image = [UIImage imageNamed: @"pantalon.jpg"];
        self.lblProductoValue.text = @"Pantalon de Vestir";
        self.lblPrecioValue.text = @"360.00";
    }
    else if (self.articulo == 8)
    {
        self.imgProducto.image = [UIImage imageNamed: @"sueter.jpg"];
        self.lblProductoValue.text = @"Sweter";
        self.lblPrecioValue.text = @"210.00";
    }
    else if (self.articulo == 9)
    {
        self.imgProducto.image = [UIImage imageNamed: @"vestidoDia.jpg"];
        self.lblProductoValue.text = @"Vestido de dia";
        self.lblPrecioValue.text = @"410.00";
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = NO;
        // Or if you wish to have the user choose a Shipping Address from those already
        // associated with the user's PayPal account, then add:
        _payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    }
    return self;
}
@end
