import XCTest
@testable import SDiffusionKit

final class SDiffusionKitTests: XCTestCase {
    func testInit() throws {
        _ = SDiffusionKit(ProcessInfo.processInfo.environment["REPLICATETOKEN"]!)
    }
    
    func testImage() async throws{
        let sDiffuion = SDiffusionKit(ProcessInfo.processInfo.environment["REPLICATETOKEN"]!)
        try await sDiffuion.imagine("Frog using a sword")
    }
}
