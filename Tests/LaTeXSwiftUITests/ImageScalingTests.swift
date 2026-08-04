#if os(macOS)
import Cocoa
import SwiftUI
import XCTest
@testable import LaTeXSwiftUI

final class ImageScalingTests: XCTestCase {
  func testRetinaScalePreservesExpectedLogicalEquationSize() {
    let source = NSImage(size: NSSize(width: 120, height: 60))

    let prepared = SwiftUI.Image.imageForDisplay(source, scale: 2.0)

    XCTAssertEqual(prepared.size.width, 60)
    XCTAssertEqual(prepared.size.height, 30)
  }

  func testNonRetinaScaleLeavesLogicalEquationSizeUnchanged() {
    let source = NSImage(size: NSSize(width: 120, height: 60))

    let prepared = SwiftUI.Image.imageForDisplay(source, scale: 1.0)

    XCTAssertEqual(prepared.size.width, 120)
    XCTAssertEqual(prepared.size.height, 60)
  }
}
#endif
