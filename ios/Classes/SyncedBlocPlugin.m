#import "SyncedBlocPlugin.h"
#if __has_include(<synced_bloc/synced_bloc-Swift.h>)
#import <synced_bloc/synced_bloc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "synced_bloc-Swift.h"
#endif

@implementation SyncedBlocPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSyncedBlocPlugin registerWithRegistrar:registrar];
}
@end
