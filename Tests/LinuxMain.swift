import XCTest

import xcode_result_bundleTests

var tests = [XCTestCaseEntry]()
tests += xcode_result_bundleTests.allTests()
XCTMain(tests)