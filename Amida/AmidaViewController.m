
#import "AmidaAppDelegate.h"
#import "AmidaViewController.h"
#import "AmidaHistoryViewController.h"

@implementation AmidaViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Action

//Newボタンが押されたら呼ばれるアクションメソッド
- (IBAction)createNewAmida
{
    contentsViewController = [[AMiContentsViewController alloc] initWithNibName:@"AMiContentsViewController" bundle:nil];
    [contentsViewController autorelease];
    
    [navigationController pushViewController:contentsViewController animated:YES];
    
    [delegate.window addSubview:navigationController.view];
}

//Historyボタンが押されたら呼ばれるアクションメソッド
- (IBAction)history
{
    historyViewController = [[AmidaHistoryViewController alloc] initWithNibName:
                             @"AmidaHistoryViewController" bundle:nil];
    [historyViewController autorelease];
    
    [navigationController pushViewController:historyViewController animated:YES];
    [delegate.window addSubview:navigationController.view];
    
    
}


@end
