import XCTest
@testable import NetworkingExtension

final class NetworkingExtensionTests: XCTestCase {
    func testFetchJsonPlaceholderData() throws {
        let baseURL = "https://jsonplaceholder.typicode.com/"
        let usersPath = "users"
        let jsonPlaceholderRouter = Router(baseURL: baseURL, path: usersPath)
        let fetchUsersRequestBuilder = BaseRequestBuilder(
            router: jsonPlaceholderRouter,
            contents: BaseRequestContents()
        )
        let request = try! XCTUnwrap(fetchUsersRequestBuilder.request, "Failed to create request")
        let expectation = XCTestExpectation(description: "fetch users request")
        Task {
            let (data, _) = try! await URLSession.shared.data(for: request)
            XCTAssertFalse(data.isEmpty, "Data is empty which means that the request is wrong formatted")
            print(String(decoding: data, as: UTF8.self))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testFetchUserUsingUserClient() throws {
        let client = UserClient()
        let expectation = XCTestExpectation(description: "fetch users request")
        Task {
            do {
                let user = try await client.fetch(identifiedBy: 1)
                XCTAssertTrue(user.id == 1)
                expectation.fulfill()
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 20)
    }
}
