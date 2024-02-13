import XCTest
@testable import MPNetworker

@available(iOS 15.0, *)
final class MPNetworkerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    // Unit Test for Latest Movie Retrieval
    func testLatestMovieRetrieval() async throws {
        let data = try await MPAPIClient.obtainLatestMovies()
        XCTAssert(data.results.count > 0)
    }
    
    // Unit Test for Popular Movie Retrieval
    func testPopularMovieRetrieval() async throws {
        let data = try await MPAPIClient.obtainPopularMovies()
        XCTAssert(data.results.count > 0)
    }
    
    // Unit Test for Test Movie Details Retrieval
    func testMovieDetailRetrievalPositiveFlow() async throws {
        let data = try await MPAPIClient.getDetails(for: 1072790)
        XCTAssert(data.title == "Anyone But You")
    }
    
    // Unit Test for Personnel List Retrieval
    func testPersonnelListRetrievalPositiveFlow() async throws {
        let data = try await MPAPIClient.getCastAndCrew(for: 1072790)
        XCTAssert(data.cast.count > 0)
    }
    
    // Unit Test for Image List Retrieval
    func testImageListRetrievalPositiveFlow() async throws {
        let data = try await MPAPIClient.getImages(for: 1072790)
        XCTAssert(data.backdrops.count > 0 || data.logos.count > 0 || data.posters.count > 0)
    }
    
    // Unit Test for Video List Retrieval
    func testVideoListRetrievalPositiveFlow() async throws {
        let data = try await MPAPIClient.getVideos(for: 1072790)
        XCTAssert(data.results.count > 0)
    }
    
    // Unit Test for Keywords Retrieval
    func testKeywordsRetievalPositiveFlow() async throws {
        let data = try await MPAPIClient.getKeywords(for: 1072790)
        XCTAssert(data.keywords.count > 0)
    }
    
    // Unit Test for Test Movie Details Retrieval Negative Flow
    func testMovieDetailRetrievalNegativeFlow() async throws {
        let data = try await MPAPIClient.getDetails(for: 1072790)
        XCTAssert(data.title == "Anyone But You")
    }
    
    // Unit Test for Personnel List Retrieval Negative Flow
    func testPersonnelListRetrievalNegativeFlow() async throws {
        do {
            let _ = try await MPAPIClient.getCastAndCrew(for: 0)
        } catch let error {
            XCTAssertEqual(error as? MPError, MPError.ServerError)
        }
    }
    
    // Unit Test for Image List Retrieval Negative Flow
    func testImageListRetrievalPNegativeFlow() async throws {
        do {
            let _ = try await MPAPIClient.getImages(for: 0)
        } catch let error {
            XCTAssertEqual(error as? MPError, MPError.ServerError)
        }
    }
    
    // Unit Test for Video List Retrieval Negative Flow
    func testVideoListRetrievalNegativeFlow() async throws {
        do {
            let _ = try await MPAPIClient.getVideos(for: 0)
        } catch let error {
            XCTAssertEqual(error as? MPError, MPError.ServerError)
        }
    }
    
    // Unit Test for Keywords Retrieval Negative Flow
    func testKeywordsRetievalNegativeFlow() async throws {
        do {
            let _ = try await MPAPIClient.getKeywords(for: 0)
        } catch let error {
            XCTAssertEqual(error as? MPError, MPError.ServerError)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
