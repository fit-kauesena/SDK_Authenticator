//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<camera_avfoundation/CameraPlugin.h>)
#import <camera_avfoundation/CameraPlugin.h>
#else
@import camera_avfoundation;
#endif

#if __has_include(<document_detector/DocumentDetectorPlugin.h>)
#import <document_detector/DocumentDetectorPlugin.h>
#else
@import document_detector;
#endif

#if __has_include(<face_authenticator/FaceAuthenticatorPlugin.h>)
#import <face_authenticator/FaceAuthenticatorPlugin.h>
#else
@import face_authenticator;
#endif

#if __has_include(<passive_face_liveness/PassiveFaceLivenessPlugin.h>)
#import <passive_face_liveness/PassiveFaceLivenessPlugin.h>
#else
@import passive_face_liveness;
#endif

#if __has_include(<permission_handler_apple/PermissionHandlerPlugin.h>)
#import <permission_handler_apple/PermissionHandlerPlugin.h>
#else
@import permission_handler_apple;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CameraPlugin registerWithRegistrar:[registry registrarForPlugin:@"CameraPlugin"]];
  [DocumentDetectorPlugin registerWithRegistrar:[registry registrarForPlugin:@"DocumentDetectorPlugin"]];
  [FaceAuthenticatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"FaceAuthenticatorPlugin"]];
  [PassiveFaceLivenessPlugin registerWithRegistrar:[registry registrarForPlugin:@"PassiveFaceLivenessPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
}

@end
