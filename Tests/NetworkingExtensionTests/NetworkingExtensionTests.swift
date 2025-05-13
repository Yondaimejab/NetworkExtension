import XCTest
import NetworkingExtension

final class NetworkingExtensionTests: XCTestCase {
    func testFetchJsonPlaceholderData() throws {
        let fetchUsersRequestBuilder = BaseRequestBuilder(
            route: CustomEnvironmentRoute.JSONPlaceholderUsersMockRoute,
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
}

extension CustomEnvironmentRoute {
    static var JSONPlaceholderUsersMockRoute: CustomEnvironmentRoute {
        CustomEnvironmentRoute(environment: .JSONPlaceholder, path: "users")
    }
}

extension Environment {
    static var JSONPlaceholder: Environment {
        Environment(baseUrl: "https://jsonplaceholder.typicode.com/")
    }
}
