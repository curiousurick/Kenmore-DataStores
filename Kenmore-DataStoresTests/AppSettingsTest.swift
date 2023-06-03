//  Copyright © 2023 George Urick
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

import XCTest
import Kenmore_Models
@testable import Kenmore_DataStores

private let QualitySettingsKey = "com.georgie.floatplane.QualitySettings"
private let FirstCreatorKey = "com.georgie.floatplane.FirstCreatorKey"

private extension AppSettings {
    func reset() {
        UserDefaults.standard.removeObject(forKey: QualitySettingsKey)
        UserDefaults.standard.removeObject(forKey: FirstCreatorKey)
    }
}

final class AppSettingsTest: XCTestCase {
    private var subject: AppSettings!

    override func setUp() {
        super.setUp()
        subject = AppSettings.instance
        subject.reset()
    }

    func testSetAndGetQualitySettings() {
        // Act
        subject.qualitySettings = .ql1080p

        // Assert
        XCTAssertEqual(subject.qualitySettings, .ql1080p)
    }

    func testGetDefaultQualityLevel() {
        // Assert
        XCTAssertEqual(subject.qualitySettings, DeliveryKeyQualityLevel.defaultLevel)
    }

    func testGetWhenSavedIsNotValidQualityLevel() {
        // Arrange
        UserDefaults.standard.set("Blah", forKey: QualitySettingsKey)

        // Assert
        XCTAssertEqual(subject.qualitySettings, DeliveryKeyQualityLevel.defaultLevel)
    }

    func testSetAndGetFirstCreatorId() {
        // Arrange
        let firstCreatorId = "linustechtips"
        // Act
        subject.firstCreatorId = firstCreatorId

        // Assert
        XCTAssertEqual(subject.firstCreatorId, firstCreatorId)
    }

    func testGetDefaultFirstCreatorId() {
        // Assert
        XCTAssertNil(subject.firstCreatorId)
    }
}
