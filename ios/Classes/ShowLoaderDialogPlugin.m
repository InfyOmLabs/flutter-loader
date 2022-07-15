#import "ShowLoaderDialogPlugin.h"
#if __has_include(<show_loader_dialog/show_loader_dialog-Swift.h>)
#import <show_loader_dialog/show_loader_dialog-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "show_loader_dialog-Swift.h"
#endif

@implementation ShowLoaderDialogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShowLoaderDialogPlugin registerWithRegistrar:registrar];
}
@end
