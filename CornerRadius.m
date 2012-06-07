//
//  CornerRadius.m
//

#import "CornerRadius.h"

#define DEFAULT_RADIUS 6

@implementation CornerRadius
@synthesize radius;

- (id)init
{
    self = [super initWithFrame:[UIScreen mainScreen].applicationFrame];
    if(self)
    {
        // Initialization
        self.backgroundColor = [UIColor clearColor];
        [self setUserInteractionEnabled:NO];
        self.radius = DEFAULT_RADIUS;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNeedsDisplay) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (id)initWithRadius:(NSInteger)r
{
    self = [self init];
    if(self) self.radius = r;
    return self;
}

- (void)drawRect:(CGRect)rect
{
    self.frame = [UIScreen mainScreen].applicationFrame;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 0, 1);
    
    // Bottom left corner
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y + rect.size.height);
    CGContextAddArc(context, rect.origin.x + self.radius, rect.origin.y + rect.size.height - self.radius, self.radius, M_PI, M_PI / 2, 1); //STS fixed
    
    // Bottom right corner
    CGContextMoveToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGContextAddArc(context, rect.origin.x + rect.size.width - self.radius, rect.origin.y + rect.size.height - self.radius, self.radius, M_PI / 2, 0.0f, 1);
    
    // Top right corner
    CGContextMoveToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
    CGContextAddArc(context, rect.origin.x + rect.size.width - self.radius, rect.origin.y + self.radius, self.radius, 0.0f, -M_PI / 2, 1);
    
    // Top left corner
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    CGContextAddArc(context, rect.origin.x + self.radius, rect.origin.y + self.radius, self.radius, -M_PI / 2, M_PI, 1);
    
    CGContextFillPath(context);
}

@end
