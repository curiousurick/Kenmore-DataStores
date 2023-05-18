// swift-tools-version:5.5
//
//  Package.swift
//
//  Copyright (c) 2022 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import PackageDescription

let package = Package(
    name: "Kenmore-DataStores",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
    ],
    products: [
        .library(
            name: "Kenmore-DataStores",
            targets: ["Kenmore-DataStores"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/curiousurick/Kenmore-Models.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/curiousurick/Kenmore-Utilities.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/kishikawakatsumi/UICKeyChainStore.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/hyperoslo/Cache.git",
            from: "6.0.0"
        ),
    ],
    targets: [
        .target(
            name: "Kenmore-DataStores",
            dependencies: [
                "Kenmore-Models",
                "Kenmore-Utilities",
                "UICKeyChainStore",
                "Cache",
            ],
            path: "Kenmore-DataStores",
            exclude: []
        ),
        .testTarget(
            name: "Kenmore-DataStoresTests",
            dependencies: [
                "Kenmore-DataStores",
                "Kenmore-Models",
                "UICKeyChainStore",
                "Cache",
            ],
            path: "Kenmore-DataStoresTests",
            exclude: [],
            resources: []
        ),
    ],
    swiftLanguageVersions: [.v5]
)
