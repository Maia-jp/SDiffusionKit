// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dalleMiniPredictionInfo = try DalleMiniPredictionInfo(json)

import Foundation

// MARK: - DalleMiniPredictionInfo
struct DalleMiniPredictionInfo: Codable,PredictionInfo {
    let completedAt, createdAt: String?
    let error: JSONNull?
    let hardware, id: String?
    let input: DalleMiniInput?
    let logs: String?
    let metrics: DalleMiniMetrics?
    let output: [String]?
    let startedAt, status: String?
    let urls: DalleMiniUrls?
    let version: String?
    let webhookCompleted: JSONNull?
    
    func getImageStringUrl() -> [String] {
        return self.output ?? []
    }

    enum CodingKeys: String, CodingKey {
        case completedAt = "completed_at"
        case createdAt = "created_at"
        case error, hardware, id, input, logs, metrics, output
        case startedAt = "started_at"
        case status, urls, version
        case webhookCompleted = "webhook_completed"
    }
}

// MARK: DalleMiniPredictionInfo convenience initializers and mutators

extension DalleMiniPredictionInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DalleMiniPredictionInfo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        completedAt: String?? = nil,
        createdAt: String?? = nil,
        error: JSONNull?? = nil,
        hardware: String?? = nil,
        id: String?? = nil,
        input: DalleMiniInput?? = nil,
        logs: String?? = nil,
        metrics: DalleMiniMetrics?? = nil,
        output: [String]?? = nil,
        startedAt: String?? = nil,
        status: String?? = nil,
        urls: DalleMiniUrls?? = nil,
        version: String?? = nil,
        webhookCompleted: JSONNull?? = nil
    ) -> DalleMiniPredictionInfo {
        return DalleMiniPredictionInfo(
            completedAt: completedAt ?? self.completedAt,
            createdAt: createdAt ?? self.createdAt,
            error: error ?? self.error,
            hardware: hardware ?? self.hardware,
            id: id ?? self.id,
            input: input ?? self.input,
            logs: logs ?? self.logs,
            metrics: metrics ?? self.metrics,
            output: output ?? self.output,
            startedAt: startedAt ?? self.startedAt,
            status: status ?? self.status,
            urls: urls ?? self.urls,
            version: version ?? self.version,
            webhookCompleted: webhookCompleted ?? self.webhookCompleted
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DalleMiniInput
struct DalleMiniInput: Codable {
    let text, topK, seamless, gridSize: String?
    let saveAsPNG, temperature, progressiveOutputs, superconditionFactor: String?

    enum CodingKeys: String, CodingKey {
        case text
        case topK = "top_k"
        case seamless
        case gridSize = "grid_size"
        case saveAsPNG = "save_as_png"
        case temperature
        case progressiveOutputs = "progressive_outputs"
        case superconditionFactor = "supercondition_factor"
    }
}

// MARK: DalleMiniInput convenience initializers and mutators

extension DalleMiniInput {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DalleMiniInput.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        text: String?? = nil,
        topK: String?? = nil,
        seamless: String?? = nil,
        gridSize: String?? = nil,
        saveAsPNG: String?? = nil,
        temperature: String?? = nil,
        progressiveOutputs: String?? = nil,
        superconditionFactor: String?? = nil
    ) -> DalleMiniInput {
        return DalleMiniInput(
            text: text ?? self.text,
            topK: topK ?? self.topK,
            seamless: seamless ?? self.seamless,
            gridSize: gridSize ?? self.gridSize,
            saveAsPNG: saveAsPNG ?? self.saveAsPNG,
            temperature: temperature ?? self.temperature,
            progressiveOutputs: progressiveOutputs ?? self.progressiveOutputs,
            superconditionFactor: superconditionFactor ?? self.superconditionFactor
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DalleMiniMetrics
struct DalleMiniMetrics: Codable {
    let predictTime: Double?

    enum CodingKeys: String, CodingKey {
        case predictTime = "predict_time"
    }
}

// MARK: DalleMiniMetrics convenience initializers and mutators

extension DalleMiniMetrics {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DalleMiniMetrics.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        predictTime: Double?? = nil
    ) -> DalleMiniMetrics {
        return DalleMiniMetrics(
            predictTime: predictTime ?? self.predictTime
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DalleMiniUrls
struct DalleMiniUrls: Codable {
    let urlsGet, cancel: String?

    enum CodingKeys: String, CodingKey {
        case urlsGet = "get"
        case cancel
    }
}

// MARK: DalleMiniUrls convenience initializers and mutators

extension DalleMiniUrls {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DalleMiniUrls.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        urlsGet: String?? = nil,
        cancel: String?? = nil
    ) -> DalleMiniUrls {
        return DalleMiniUrls(
            urlsGet: urlsGet ?? self.urlsGet,
            cancel: cancel ?? self.cancel
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

