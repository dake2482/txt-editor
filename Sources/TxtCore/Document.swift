import Foundation

public func encodeDocument(text: String) -> Data {
    Data(text.utf8)
}

public func decodeDocument(data: Data) throws -> String {
    guard let text = String(data: data, encoding: .utf8) else {
        throw DecodingError.dataCorrupted(
            .init(
                codingPath: [],
                debugDescription: "Document data is not valid UTF-8."
            )
        )
    }

    return text
}

public func isPlainTextFile(url: URL) -> Bool {
    url.pathExtension.lowercased() == "txt"
}
