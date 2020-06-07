#import "FzwallpaperPlugin.h"
#if __has_include(<fzwallpaper/fzwallpaper-Swift.h>)
#import <fzwallpaper/fzwallpaper-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fzwallpaper-Swift.h"
#endif

@implementation FzwallpaperPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFzwallpaperPlugin registerWithRegistrar:registrar];
}
@end
