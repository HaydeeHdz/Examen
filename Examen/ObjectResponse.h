//
//  ObjectResponse.h
//  Examen
//
//  Created by Haydee on 8/28/16.
//  Copyright © 2016 Haydee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Coord.h"
#import "Weather.h"
#import "MainObject.h"

@interface ObjectResponse : NSObject
@property (nonatomic,strong) MainObject *main;
@property (nonatomic,strong) Coord *coord;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) Weather *weather;

@end
