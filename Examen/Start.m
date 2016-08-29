//
//  ViewController.m
//  Examen
//
//  Created by Haydee on 8/28/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import "Start.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface Start ()

@end

@implementation Start{
    GMSMapView          *mapView_;
    GMSMarker           *markerLocation;
    GMSCameraPosition   *camera;
    CLLocationManager   *locationManager;
    MainObject *mainObject;
    Weather *weatherItem;
}
//@synthesize mapContainer;
NSString *latitud;
NSString *longitud;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nibs
    [self createMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createMap{
    // Create a GMSCameraPosition that tells the map to display the
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.887273
                                                            longitude:-102.203875
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.delegate=self;
    self.view = mapView_;
    NSLog(@"Hello2");
}


/**********************************************************************************************/
#pragma mark - GMSMapViewDelegate
/**********************************************************************************************/
- (void)mapView:(GMSMapView *)mapView
didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    latitud = [NSString stringWithFormat:@"%f", coordinate.latitude];
    longitud = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    //Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker.map = mapView_;
    
    [self queueLoadData];
}

/**********************************************************************************************/
#pragma mark - Task methods
/**********************************************************************************************/
- (void)queueLoadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    //[self.activityLoad startAnimating];
    
    NSOperationQueue *queue         = [NSOperationQueue new];
    NSInvocationOperation *opGet    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    [queue addOperation:opGet];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opGet];
    [queue addOperation:opDidGet];
}

//----------------------------------------------------------------------------------------------
- (void)loadData {
    mjsonGeo    = [WebServices getWeatherWithLatitude:latitud AndLongitude:longitud];
    print(NSLog(@"mjsonGeo  = %@",mjsonGeo))
}
//----------------------------------------------------------------------------------------------
- (void)didLoadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        ObjectResponse *object          = [Parser parseGeoObject];
        mainObject                      = object.main;
        mainObject.name                 = object.name;
        NSArray *arrayWeather             = (NSArray *)object.weather;
        weatherItem = arrayWeather[0];
        
        NSLog(@"imagen  = %@",weatherItem.icon);

        
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible   = NO;
        
        [self performSegueWithIdentifier:@"MapResults" sender:self];
    });
}

/**********************************************************************************************/
#pragma mark - Navigation
/*******************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MapResults *results   = [segue destinationViewController];
    results.lblName       = mainObject.name;
    results.lblTempMi     = [NSString stringWithFormat:@"%f", mainObject.temp_min];
    results.lblTempMa     = [NSString stringWithFormat:@"%f", mainObject.temp_max];
    results.lblHum        = [NSString stringWithFormat:@"%f", mainObject.humidity];
    results.img           = weatherItem.icon;
}

@end
