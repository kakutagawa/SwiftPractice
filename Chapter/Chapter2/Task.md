# Chapter2課題

初期画面

<img src="Img/Task/Init.png" width="30%">

## 【TODO1】 StoryboardにUITableViewを配置しよう
【やること】

- ChapterTwo.storyboardに`UITableViewを配置しましょう
  - 制約ルール: 画面幅いっぱい
- 配置できたか確認のために配置した`UITableView`の背景色を赤色に変更しましょう(設定できていることが確認できましたら背景色を元に戻しておいてください)

完成予想図

<Img src="Img/Task/Todo1.png" width="30%">

## 【TODO2】 UITableViewをChapterTwoViewControllerにアウトレット接続しよう
【やること】

- `ChapterTwo.storyboard`で設置した`UITableView`を`ChapterTwpViewController`にアウトレット接続させましょう(名前は「tableView」として設定してください)

## 【TODO3】 UITableViewに表示するデータを用意しよう
【やること】

- `ChapterTwoViewController`内に`UITableView`で表示するデータを配列で定義しましょう
  - 表示するデータは以下のようにしてください `犬、猫、パンダ、ライオン、ゴリラ`

<details>

<summary>ヒント</summary>

```swift
final class ChapterTwoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    let animals = [表示するデータ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

</details>

## 【TODO4】 delegate、dataSourceを設定しよう
`Tutorial.md`で説明したように、`UITableView`では設定に関する`delegate`とデータの表示に関する`dataSource`がそれぞれ必要になります。

今回は`delegate`で「表示するセルの高さ」の処理、`dataSource`で「表示するデータの数」、「どのようなデータを表示するか」の処理をそれぞれ実装しましょう。

【やること】

- `ChapterTwoViewController`で定義した`tableView`にdelegateとdataSourceをそれぞれ設定しましょう

<details>

<summary>ヒント</summary>

```swift
final class ChapterTwoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    let animals = [表示するデータ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = ???
        tableView.dataSource = ???
    }
}
```

</details>

- `UITableViewDelegate`、`UITableViewDataSource`を準拠させましょう
  - `UITableViewDataSource`を準拠させるとエラーが出ますが一旦無視して構いません

<details>

<summary>ヒント</summary>

```swift
final class ChapterTwoViewController: UIViewController, ???(準拠させるプロトコル) {
    @IBOutlet var tableView: UITableView!

    let animals = [表示するデータ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = ???
        tableView.dataSource = ???
    }
}
```

</details>

## 【TODO5】 UITableViewDataSourceでデータを表示するための処理を実装しよう
【やること】

- 以下の2つの関数の処理を作成しましょう
  - `func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int`
  - `func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell`

```swift
// 表示するデータの数
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // 表示したいデータの数を記述します
}

// どのようなデータを表示するか
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // セルの生成(再利用)をします
    // セルはパフォーマンスの関係上、毎回新しいセルを作成するわけではありません
    // そのため再利用できるセルがあればそのセルを使用、なければ新しく作成をします
    // dequeueReusableCell(withIdentifier:for:)で再利用するためのセルの設定をします(ここでは"cell"というIDで再利用できるようにするセルの定義しています)
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = ??? // 定義した配列のデータをindexPathを使用して表示してください
    return cell
}
```

## 【TODO6】 UITableViewDelegateで表示するセルの高さの処理を実装しよう
【やること】

- 以下の関数の処理を作成しましょう
  - `func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat`

-  表示するセルの高さを100pxに設定しましょう

```swift
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    // 表示する高さを記述します
}
```

## 【TODO7】 使用するセルをtableViewに登録しましょう
【やること】

- `tableView`に使用するセルの登録をしましょう

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(使用するセルのクラス名.self, forCellReuseIdentifier: "再利用する際に設定したID")
}
```

<details>

<summary>ヒント</summary>

```swift
final class ChapterTwoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    let animals = ["犬", "猫", "パンダ", "ライオン", "ゴリラ"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = ???
        tableView.dataSource = ???
        tableView.register(使用するセルのクラス名.self, forCellReuseIdentifier: "再利用する際に設定したID")
    }
}

extension ChapterTwoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension ChapterTwoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = animals[indexPath.row]
        return cell
    }
}
```

</details>

完成予想図

<Img src="Img/Task/Todo7.png" width="30%">