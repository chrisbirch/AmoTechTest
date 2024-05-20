import UIKit


class LoremIpsumTableViewController: UITableViewController {
    private let cellReuseIdentifier = "ListCell"
    private let viewModel = LoremIpsumTableViewModel()

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? LoremIpsumTableViewCell else {
            return .init()
        }
        cell.loremIpsumPhotoItem = viewModel.item(for: indexPath.row)
        return cell
    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)

        guard let model = viewModel.item(for: indexPath.row) else {
            return 
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.refresh(in: tableView)
    }
}
