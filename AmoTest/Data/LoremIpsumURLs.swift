import Foundation

enum LoremIpsumURLs {
    case photos

    var url: URL {
        switch self {
        case .photos:
            return URL(string: "https://firebasestorage.googleapis.com/v0/b/amo-tech-interview.appspot.com/o/photos%2Fpage-1.json?alt=media")!
        }
    }
}
