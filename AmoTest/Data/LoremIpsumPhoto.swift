import Foundation

struct LoremIpsumPhoto: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: URL
    let thumbnailUrl: URL
}
