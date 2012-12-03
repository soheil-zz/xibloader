xibloader
=========

Load XIB Files Programmatically

First create a new Run Script phase for your target. Copy and paste the script `convert-xib.sh` from this repo in it.

Ensure that RESOURCE_FOLDER points to the location where you have the XIBLoader.* files (ensure not to add these files to your Xcode project target, these are just templates which should not be compiled.)

Once the build finishes the produced files will be inside RESOURCE_DIR/Derived folder.

Now you will need to add these to your Xcode project. From now on every time you build the project the XIBLoader.* files get overwritten reflecting the latest changes to your XIB files.

### Usage

Now everywhere that you used to provide the name of your XIB file as a string replace it with a call to `instantiateXIBWithOwner(NSString* name, NSObject *owner)`

### Example

    ViewController *viewController1 = [[ExampleViewController alloc] init];
    instantiateXIBWithOwner(@"ExampleViewController_iPhone", viewController1);
