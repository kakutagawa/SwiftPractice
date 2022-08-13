import SnapKit
import UIKit

enum MainSection {
    case main
}

enum MainItem: String, Hashable, CaseIterable {
    case chapter0
    case chapter1
}

final class MainViewController: UIViewController {
    private var dataSource: UITableViewDiffableDataSource<MainSection, MainItem>!

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }

    private func setupView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        title = "トップ画面"
    }

    private func setupTableView() {
        dataSource = configureDataSource()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = dataSource
        tableView.delegate = self

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<MainSection, MainItem>()
        dataSourceSnapshot.appendSections([.main])
        dataSourceSnapshot.appendItems(MainItem.allCases)

        dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
    }

    private func configureDataSource() -> UITableViewDiffableDataSource<MainSection, MainItem> {
        .init(tableView: tableView) { [weak self] tableView, indexPath, item in
            guard let self = self else {
                return .init()
            }

            return self.makeCell(
                tableView: tableView,
                indexPath: indexPath,
                item: item
            )
        }
    }

    private func makeCell(
        tableView: UITableView,
        indexPath: IndexPath,
        item: MainItem
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = item.rawValue
        cell.contentConfiguration = content

        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
