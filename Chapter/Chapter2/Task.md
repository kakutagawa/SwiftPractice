# Chapter2課題

初期画面

<img src="Img/Task/Init.png" width="30%">

## TODO1: StoryboardにUITableViewを配置しよう
【やること】
* ChapterTwo.storyboardに`UITableViewを配置しましょう
* 配置した`UITableView`の制約は「画面幅いっぱい」で表示するように付けてみましょう
* 配置できたか確認のために配置した`UITableView`の背景色を赤色にしましょう(設定できていることが確認できましたら背景色を元に戻しておいてください)

完成予想図

<Img src="Img/Task/Todo1.png" width="30%">

## TODO2: UITableViewをChapterTwoViewControllerに接続しよう
【やること】
* ChpaterTwo.storyboardに配置した`UITableView`を`ChapterTwoViewController.swift`に接続しましょう
  - 接続先の命名は「tableView」としてください

## TODO3: UITableViewに表示するデータを用意しよう
【やること】
* ChapterTwoViewController内にUITableViewで表示するデータを配列で定義しましょう
  - 表示するデータは以下のようにしてください `犬、猫、パンダ、ライオン、ゴリラ`

## TODO4: delegate、dataSourceを設定しよう
チュートリアルで説明したように、`UITableView`では設定に関する`delegate`とデータの表示に関する`dataSource`がそれぞれ必要になります。

今回は`delegate`で「表示するセルの高さ」の処理、`dataSource`で「表示するデータの数」、「どのようなデータを表示するか」の処理をそれぞれ実装しましょう。

【やること】
* ChapterTwoViewControllerで定義した`tableView`にdelegateとdataSourceをそれぞれ設定しましょう
  - `tableView.delegate = ???`, `tableView.dataSource = ???`

* `UITableViewDelegate`、`UITableViewDataSource`をそれぞれ上記で設定した`???`に準拠させましょう
  - `UITableViewDataSource`を準拠させた際にエラーが発生しますが一旦無視して構いません

## TODO5: UITableViewDataSourceでデータを表示するための処理を実装しよう
* 以下の2つの関数の処理を作成しましょう
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

## TODO6: UITableViewDelegateで表示するセルの高さの処理を実装しよう
* 以下の関数の処理を作成しましょう
- `func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat`

* 表示するセルの高さを100pxに設定しましょう

```swift
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    // 表示する高さを記述します
}
```

## TODO7: 使用するセルをtableViewに登録しましょう
* `tableView`に使用するセルの登録をしましょう

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = ???
    tableView.dataSource = ???
    `tableView.register(使用するセルのクラス名.self, forCellReuseIdentifier: "再利用する際に設定したID")`
}
```

完成予想図

<Img src="Img/Task/Todo7.png" width="30%">