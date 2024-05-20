import UIKit

class LoremIpsumTableViewModel: NSObject {

    enum State {
        case downloading
        case error(Error)
        case downloaded(items: [LoremIpsumPhoto])
    }
    @Inject private var loremIpsumService: LoremIpsumService

    private(set)var state: State = .downloading
    var numberOfRows: Int {
        switch state {
        case .downloading, .error:
            return 0
        case let .downloaded(items):
            print(items.count)
            return items.count
        }
    }

    private var task: Task<(), Never>?
    func item(for row: Int) -> LoremIpsumPhoto? {
        switch state {
        case .downloading, .error:
            return nil
        case let .downloaded(items):
            return items[safe: row]
        }
    }
    
    func refresh(in tableView: UITableView) {
        state = .downloading
        task?.cancel()
        task = Task {[weak self] in
            guard let self else { return }
            do {
                let photos = try await self.loremIpsumService.getPhotoList()
                print("Downloaded")
                self.state = .downloaded(items: photos)
            } catch {
                self.state = .error(error)
            }

            Task.detached { @MainActor in
                print("Tableview refreshing")
                tableView.reloadData()
            }
        }
    }
}
