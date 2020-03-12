//
//  RCTMGLUserLocation.m
//  RCTMGL
//

#import "RCTMGLUserLocation.h"
#import <Mapbox/MGLUserLocationAnnotationView.h>
#import "MGLFaux3DUserLocationAnnotationView.h"

@interface HiddenUserLocationAnnotationView : MGLUserLocationAnnotationView

@end

@implementation HiddenUserLocationAnnotationView


- (void)update {
    self.frame = CGRectNull;
}

@end


@implementation RCTMGLUserLocation : NSObject

+ (id)sharedInstance
{
    static RCTMGLUserLocation *userLocation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ userLocation = [[self alloc] init]; });
    return userLocation;
}

- (MGLUserLocationAnnotationView*)builtinUserAnnotation
{
    return [[MGLFaux3DUserLocationAnnotationView alloc] init];
}

@end
