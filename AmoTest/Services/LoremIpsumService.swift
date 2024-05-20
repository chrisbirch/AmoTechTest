import Foundation

protocol LoremIpsumService {
    func getPhotoList() async throws -> [LoremIpsumPhoto]
}

fileprivate struct LoremIpsumContainer: Decodable {
    let photos: [LoremIpsumPhoto]
}

class LoremIpsumServiceImplementation: LoremIpsumService {
    @Inject private var networkService: NetworkService

    func getPhotoList() async throws -> [LoremIpsumPhoto] {


        let request = URLRequest(url: LoremIpsumURLs.photos.url)
        let data = try await networkService.request(request)

        let container = try JSONDecoder().decode(LoremIpsumContainer.self, from: data)
        return container.photos
    }
}
