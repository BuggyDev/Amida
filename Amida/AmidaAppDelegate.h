
#import <UIKit/UIKit.h>

@class AmidaViewController;

@interface AmidaAppDelegate : NSObject <UIApplicationDelegate>
{
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AmidaViewController *viewController;

+ (AmidaAppDelegate *)sharedController;
@end
