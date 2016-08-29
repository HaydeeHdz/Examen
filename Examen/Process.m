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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Start out working with the test environment! When you are ready, switch to PayPalEnvironmentProduction.
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
}

- (IBAction)pay {
    
    // Create a PayPalPayment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    // Amount, currency, and description
    payment.amount = [[NSDecimalNumber alloc] initWithString:@"10"];
    payment.currencyCode = @"USD";
    payment.shortDescription = @"Awesome saws";
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture.
    // To perform Authorization only, and defer Capture to your server,
    // use PayPalPaymentIntentAuthorize.
    // To place an Order, and defer both Authorization and Capture to
    // your server, use PayPalPaymentIntentOrder.
    // (PayPalPaymentIntentOrder is valid only for PayPal payments, not credit card payments.)
    payment.intent = PayPalPaymentIntentSale;
    
    // If your app collects Shipping Address information from the customer,
    // or already stores that information on your server, you may provide it here.
    //payment.shippingAddress = address; // a previously-created PayPalShippingAddress object
    
    // Several other optional fields that you can set here are documented in PayPalPayment.h,
    // including paymentDetails, items, invoiceNumber, custom, softDescriptor, etc.
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    // Create a PayPalPaymentViewController.
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];
}

/*******************************************************************************************/
#pragma mark - PayPalPaymentDelegate methods
/*******************************************************************************************/
- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    
    // Dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    // Send the entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation
                                                           options:0
                                                             error:nil];
    
    // Send confirmation to your server; your server should verify the proof of payment
    // and give the user their goods or services. If the server is not reachable, save
    // the confirmation and try again later.
}
@end
