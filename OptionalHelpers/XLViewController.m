#import "XLViewController.h"
#import "XIBLoader.h"

@interface XLViewController ()

@end

@implementation XLViewController

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
