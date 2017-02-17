//
//  AggregateShapeController.m
//
//  Created by Kedar Kulkarni on 25/12/16.
//  Copyright © 2016 Kedar Kulkarni. All rights reserved.
//

#import "AggregateShapeController.h"

#define ARC4RANDOM_MAX 0x100000000
#define radiansToDegrees(radians) ((radians)*(180.0/M_PI))

@implementation AggregateShapeController

+ (UIBezierPath *)polygonForSize:(int)polygonSize andNumberOfSides:(int)numberOfSides {
    float sideLength = polygonSize;
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
    
    float x = ((float)arc4random() / ARC4RANDOM_MAX)
    * ((240 - sideLength) - sideLength)
    + sideLength;
    float y = ((float)arc4random() / ARC4RANDOM_MAX)
    * ((240 - sideLength) - sideLength)
    + sideLength;
    
    [polygonPath moveToPoint:CGPointMake(x, y)];
    
    float maxAngle = 2*M_PI;
    float minAngle = 0;

    for (int i=0; i<numberOfSides; i++) {
        double randomAngle = ((double)arc4random() / ARC4RANDOM_MAX)
        * (maxAngle - minAngle)
        + minAngle;
        
        minAngle = randomAngle;
        maxAngle = minAngle + M_PI_2;
        
        NSLog(@"Min angle = %f, Max Angle = %f, Angle Chosen = %f", radiansToDegrees(minAngle), radiansToDegrees(maxAngle), radiansToDegrees(randomAngle));
        
        x = x + sideLength*cosf(randomAngle);
        y = y + sideLength*sin(randomAngle);
        
        [polygonPath addLineToPoint:CGPointMake(x, y)];
    }
    
    [polygonPath closePath];
    
    return polygonPath;
}

@end
