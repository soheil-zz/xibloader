#import "XIBLoader.h"

/*{%NIBDATA START%}*/
/*{%NIBDATA END%}*/

void instantiateXIBWithOwner(NSString* name, NSObject *owner)
{
    /*{%LOAD_TEMPLATE%}
     if ([name isEqualToString:@"ORIGINAL_FILENAME_WITH_NO_EXTENSION"]) {
         static UINib *_SANITISED_FILENAME = nil;
         if (!_SANITISED_FILENAME) {
             _SANITISED_FILENAME = [UINib nibWithData:[NSData dataWithBytesNoCopy:SANITISED_FILENAME
             length:SANITISED_FILENAME_len freeWhenDone:NO] bundle:nil];
         }
         [_SANITISED_FILENAME instantiateWithOwner:owner options:nil];
     }
     {%LOAD_TEMPLATE END%}*/
    
    /*{%NIBLOADERS START%}*/
    /*{%NIBLOADERS END%}*/
}
