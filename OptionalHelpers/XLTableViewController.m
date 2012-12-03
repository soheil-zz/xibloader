#import "XLTableViewController.h"
#import "XIBLoader.h"

@interface XLTableViewController ()

@end

@implementation XLTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    // Load the NIB file from our derived class with nib hex data
    instantiateXIBWithOwner(nibNameOrNil, self);
    return self;
}

@end
