#import "XIBLoaderViewController.h"
#import "XIBLoader.h"

@interface XIBLoaderViewController ()

@end

@implementation XIBLoaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    instantiateXIBWithOwner(nibNameOrNil, self);
    return self;
}

@end
