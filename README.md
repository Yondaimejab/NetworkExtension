# NetworkExtension
Framework para facilitar el envío de request a servidores.

## Highlights
- Strongly typed HTTP methods.
- Explicit query parameters and request bodies.
- Multipart form data to upload files.
- Compatible with URLSession download tasks for file downloads.

## Usage

### Basic request
```swift
let route = CustomEnvironmentRoute(environment: Environment(baseUrl: "https://api.example.com"), path: "/users")
let contents = BaseRequestContents(method: .get, queryParameters: ["page": 1])
let builder = BaseRequestBuilder(route: route, contents: contents)
let request = builder.request
```

### JSON body
```swift
let contents = BaseRequestContents(
    method: .post,
    body: .json(["name": "Joel", "role": "Admin"])
)
```

### Upload files (multipart/form-data)
```swift
let avatarPart = try MultipartFormDataPart.file(
    name: "avatar",
    fileURL: avatarURL,
    mimeType: "image/png"
)
let formData = MultipartFormData(parts: [avatarPart])
let contents = BaseRequestContents(method: .post, body: .multipart(formData))
```

### Download files
```swift
let contents = BaseRequestContents(method: .get)
let builder = BaseRequestBuilder(route: route, contents: contents)
let request = builder.request
let task = URLSession.shared.downloadTask(with: request!)
task.resume()
```
