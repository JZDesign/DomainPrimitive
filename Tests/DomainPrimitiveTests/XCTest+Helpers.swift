import Foundation
import XCTest

extension XCTestCase {
    func compare(file fileName: String, withContent content: String, file: StaticString = #file, line: UInt = #line) throws {
        let url = url(file: fileName)
        guard let storedData = try? String(contentsOf: url) else {
            XCTFail("Failed to load stored data at URL: \(url). Use the `record` method to store a snapshot before asserting.", file: file, line: line)
            return
        }

        if content != storedData {
            let temporaryURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
                .appendingPathComponent(url.lastPathComponent)

            try? content.write(to: temporaryURL, atomically: true, encoding: .utf8)

            XCTFail("New data does not match stored file.\nNew Content:\n\(content)\nStored Content:\n\(storedData)\nNew URL: \(temporaryURL), Stored URL: \(url)", file: file, line: line)
        }
    }

    func record(file fileName: String, withContent content: String) throws {
        let url = url(file: fileName)

        try FileManager.default.createDirectory(
            at: url.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )

        try content.write(to: url, atomically: true, encoding: .utf8)
    }

    func url(file: String) -> URL {
        URL(fileURLWithPath: String(describing: #file))
            .deletingLastPathComponent()
            .appendingPathComponent("Examples")
            .appendingPathComponent("\(file).json")
    }
}
