//
//  AggregateShapeController.h
//
//  Created by Kedar Kulkarni on 25/12/16.
//  Copyright © 2016 Kedar Kulkarni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface AggregateShapeController : NSObject

+ (UIBezierPath *)polygonForSize:(int)polygonSize andNumberOfSides:(int)numberOfSides;

@end
