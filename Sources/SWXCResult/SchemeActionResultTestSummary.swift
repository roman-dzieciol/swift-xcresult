
import Foundation

public final class SchemeActionResultTestSummary: Codable {

    public let FormatVersion: String

    public let RunDestination: SchemeActionRunDestinationRecord

    public let TestableSummaries: [SchemeActionTestableSummary]

    public static func from(contentsOf url: URL) throws -> SchemeActionResultTestSummary {
        let inputData = try Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try decoder.decode(SchemeActionResultTestSummary.self, from: inputData)
    }
}
