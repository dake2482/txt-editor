import Darwin
import Foundation
import TxtCore

var failureCount = 0

func pass(_ description: String) {
    print("PASS: \(description)")
}

@MainActor
func fail(_ description: String) {
    failureCount += 1
    print("FAIL: \(description)")
}

do {
    let original = "你好"
    let decoded = try decodeDocument(data: encodeDocument(text: original))
    decoded == original
        ? pass("UTF-8 Chinese round-trip")
        : fail("UTF-8 Chinese round-trip")
} catch {
    fail("UTF-8 Chinese round-trip threw \(type(of: error))")
}

do {
    let original = ""
    let decoded = try decodeDocument(data: encodeDocument(text: original))
    decoded == original
        ? pass("empty string round-trip")
        : fail("empty string round-trip")
} catch {
    fail("empty string round-trip threw \(type(of: error))")
}

do {
    _ = try decodeDocument(data: Data([0xFF]))
    fail("invalid UTF-8 throws DecodingError")
} catch is DecodingError {
    pass("invalid UTF-8 throws DecodingError")
} catch {
    fail("invalid UTF-8 threw unexpected \(type(of: error))")
}

let txtURL = URL(fileURLWithPath: "/tmp/example.txt")
let nonTxtURL = URL(fileURLWithPath: "/tmp/example.md")
if isPlainTextFile(url: txtURL) && !isPlainTextFile(url: nonTxtURL) {
    pass("only .txt extension is recognized")
} else {
    fail("only .txt extension is recognized")
}

exit(failureCount == 0 ? EXIT_SUCCESS : EXIT_FAILURE)
