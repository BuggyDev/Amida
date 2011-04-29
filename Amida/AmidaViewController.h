
#import <UIKit/UIKit.h>

@class AmidaAppDelegate;
@class AmidaDetailViewController;
@class AmidaHistoryViewController;

@interface AmidaViewController : UIViewController
{
    AmidaAppDelegate *delegate;
    AmidaDetailViewController *detailViewController;
    AmidaHistoryViewController *historyViewController;
    UINavigationController *navigationController;
}

- (IBAction)createNewAmida;
- (IBAction)history;

@end
