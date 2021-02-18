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

    func testSecureBytesConcat() {
        let s1 = try! SecureBytes(source: [1, 2, 3, 4])
        let s2 = try! SecureBytes(source: [5, 6, 7])
        let s3 = try! SecureBytes(source: [8])
        let s4 = try! SecureBytes(source: [])

        let combined = try! SecureBytes.concat(input: [s1, s2, s3, s4])
        let expected = try! SecureBytes(source: [1, 2, 3, 4, 5, 6, 7, 8])
        XCTAssertEqual(combined, expected)
    }

    func testSecureBytesFromCountReplaceSubrange() {
        let s1 = try! SecureBytes(source: [1,2,3,4,5,6])
        let replace1 = try! SecureBytes(source: [9, 8, 7])

        s1.replace(subrange: 1..<4, with: replace1)

        let expected1 = try! SecureBytes(source: [1,9,8,7,5,6])
        XCTAssertEqual(s1, expected1)

        let s2 = try! SecureBytes(source: [1, 2, 3, 4, 5, 6])
        let replace2 = try! SecureBytes(source: [6, 5, 4, 3, 2, 1])

        s2.replace(subrange: 0..<s2.count, with: replace2)

        XCTAssertEqual(s2, replace2)
    }

    func testSecureBytesFromSourceReplaceSubrange() {
        let s1 = try! SecureBytes(count: 5)
        let s2 = try! SecureBytes(source: [1,2,3])

        s1.replace(subrange: 1..<4, with: s2)

        let expected: ContiguousArray<UInt8> = [0,1,2,3,0]
        XCTAssertEqual(s1.bytes, expected)
    }

    func testSecureBytesInits() {
        let message = "hello world"

        // count
        let s1 = try! SecureBytes(count: 8)
        // Data
        let s2 = try! SecureBytes(source: message.data(using: .utf8)!)
        // UnsafeRawBufferPointer
        let unsafeRawBufferPointer: UnsafeRawBufferPointer = "hello world".bytes.withUnsafeBytes { $0 }

        let s3 = try! SecureBytes(source: unsafeRawBufferPointer)

        let expected1: ContiguousArray<UInt8> = [0,0,0,0,0,0,0,0]
        let expected2: ContiguousArray<UInt8> = ContiguousArray(message.data(using: .utf8)!)
        let expected3: ContiguousArray<UInt8> = ContiguousArray(message.bytes)

        XCTAssertEqual(s1.bytes, expected1)
        XCTAssertEqual(s2.bytes, expected2)
        XCTAssertEqual(s3.bytes, expected3)
    }

    func testSecureBytesViewBytes() {
        let s1 = try! SecureBytes(source: [1,2,3,4,5,6])
        let s2 = s1.viewBytes(in: 2..<5)

        let expected: ArraySlice<UInt8> = [3, 4, 5]

        XCTAssertEqual(s2, expected)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

extension String {
    var bytes: [UInt8] { return Array<UInt8>(self.utf8) }
}
