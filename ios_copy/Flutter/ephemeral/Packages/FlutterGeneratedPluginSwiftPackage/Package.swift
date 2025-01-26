// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Generated file. Do not edit.
//

import PackageDescription

let package = Package(
    name: "FlutterGeneratedPluginSwiftPackage",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "FlutterGeneratedPluginSwiftPackage", type: .static, targets: ["FlutterGeneratedPluginSwiftPackage"])
    ],
    dependencies: [
        .package(name: "connectivity_plus", path: "/Users/mohit/.pub-cache/hosted/pub.dev/connectivity_plus-6.1.1/darwin/connectivity_plus"),
        .package(name: "firebase_core", path: "/Users/mohit/.pub-cache/hosted/pub.dev/firebase_core-3.9.0/ios/firebase_core"),
        .package(name: "image_picker_ios", path: "/Users/mohit/.pub-cache/hosted/pub.dev/image_picker_ios-0.8.12+1/ios/image_picker_ios"),
        .package(name: "package_info_plus", path: "/Users/mohit/.pub-cache/hosted/pub.dev/package_info_plus-8.1.2/ios/package_info_plus"),
        .package(name: "path_provider_foundation", path: "/Users/mohit/.pub-cache/hosted/pub.dev/path_provider_foundation-2.4.1/darwin/path_provider_foundation"),
        .package(name: "pointer_interceptor_ios", path: "/Users/mohit/.pub-cache/hosted/pub.dev/pointer_interceptor_ios-0.10.1/ios/pointer_interceptor_ios"),
        .package(name: "share_plus", path: "/Users/mohit/.pub-cache/hosted/pub.dev/share_plus-10.1.3/ios/share_plus"),
        .package(name: "shared_preferences_foundation", path: "/Users/mohit/.pub-cache/hosted/pub.dev/shared_preferences_foundation-2.5.4/darwin/shared_preferences_foundation"),
        .package(name: "sqflite_darwin", path: "/Users/mohit/.pub-cache/hosted/pub.dev/sqflite_darwin-2.4.1/darwin/sqflite_darwin"),
        .package(name: "url_launcher_ios", path: "/Users/mohit/.pub-cache/hosted/pub.dev/url_launcher_ios-6.3.2/ios/url_launcher_ios"),
        .package(name: "video_player_avfoundation", path: "/Users/mohit/.pub-cache/hosted/pub.dev/video_player_avfoundation-2.6.5/darwin/video_player_avfoundation"),
        .package(name: "webview_flutter_wkwebview", path: "/Users/mohit/.pub-cache/hosted/pub.dev/webview_flutter_wkwebview-3.16.3/darwin/webview_flutter_wkwebview")
    ],
    targets: [
        .target(
            name: "FlutterGeneratedPluginSwiftPackage",
            dependencies: [
                .product(name: "connectivity-plus", package: "connectivity_plus"),
                .product(name: "firebase-core", package: "firebase_core"),
                .product(name: "image-picker-ios", package: "image_picker_ios"),
                .product(name: "package-info-plus", package: "package_info_plus"),
                .product(name: "path-provider-foundation", package: "path_provider_foundation"),
                .product(name: "pointer-interceptor-ios", package: "pointer_interceptor_ios"),
                .product(name: "share-plus", package: "share_plus"),
                .product(name: "shared-preferences-foundation", package: "shared_preferences_foundation"),
                .product(name: "sqflite-darwin", package: "sqflite_darwin"),
                .product(name: "url-launcher-ios", package: "url_launcher_ios"),
                .product(name: "video-player-avfoundation", package: "video_player_avfoundation"),
                .product(name: "webview-flutter-wkwebview", package: "webview_flutter_wkwebview")
            ]
        )
    ]
)
