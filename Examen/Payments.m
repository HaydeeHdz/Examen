//
//  Payments.m
//  Examen
//
//  Created by Haydee on 8/29/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import "Payments.h"

@interface Payments ()
@property NSMutableArray *NombreProd;
@property NSMutableArray *Precio;
@property NSMutableArray *Imagen;
@end

@implementation Payments

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initController {
    self.NombreProd   = [[NSMutableArray alloc] initWithObjects: @"Blusa para dama", @"Short", @"Vestido de Noche", @"Abrigo", @"Chamarra", @"Falda", @"Jeans", @"Pantalon de Vestir", @"Sweter", @"Vestido de dia",nil];
    
    self.Imagen   = [[NSMutableArray alloc] initWithObjects: @"blusa.jpg", @"short.jpg", @"vestidoLargo.jpg", @"abrigo.jpg", @"chamarra.jpg", @"falda.jpg", @"jeans.jpg", @"pantalon.jpg", @"sueter.jpg", @"vestidoDia.jpg",nil];
    self.Precio = [[NSMutableArray alloc] initWithObjects: @"$220", @"$180", @"$490", @"$880", @"$750", @"$230", @"$350", @"$360", @"210", @"410",nil];
}

/**********************************************************************************************/
#pragma mark - Table methods and delegates
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.NombreProd.count;
    return 16;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellPayments *cell = (cellPayments *)[tableView dequeueReusableCellWithIdentifier:@"cellPayments"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellPayments" bundle:nil] forCellReuseIdentifier:@"cellPayments"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellPayments"];
    }
    
  
    //Fill cell with info from arrays
    cell.lblNombreValue.text   = self.NombreProd[indexPath.row];
    cell.lblPrecioValue.text   = self.Precio[indexPath.row];
    cell.imgProducto.image   = [UIImage imageNamed:self.Imagen[indexPath.row]];
    self.bntRow = (int)indexPath.row;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(235,80,70,30);
    btn.tag =self.bntRow;
    [btn setTitle:@"Comprar" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn addTarget:self action:@selector(boton1:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    return cell;
    
}
-(IBAction)boton1:(id)sender
{
    //NSString *test = [NSString stringWithFormat:@"botonazo %d", boton.tag];
    
    UIButton *boton = sender;
    self.bntRow =(int)boton.tag;
    [self performSegueWithIdentifier:@"Process" sender:self];
}


/**********************************************************************************************/
#pragma mark - Navigation
/*******************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    Process *results   = [segue destinationViewController];
    results.articulo      = self.bntRow;
}
@end
