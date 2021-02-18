import XCTest
@testable import SecureBytes

final class SecureBytesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let sb = try! SecureBytes(count: 10)
        XCTAssertTrue(sb.count == 10)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
