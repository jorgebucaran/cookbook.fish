# Fish 食譜

> From Shell to Plate: Savor the Zest of Fish 🦞

歡迎閱讀《Fish 食譜》，完全釋放 Fish 殼層腳本潛力的終極指南。Fish 憑藉著它友善且方便的功能脫穎而出，成為殼層中的明珠。

無論是經驗豐富的「大廚」，或是殼層腳本的菜鳥，都能透過我們精選的 Fish「料理配方」來掌握程式設計挑戰，輕鬆閱讀程式碼。

這本食譜以 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0) 授權，以確保知識與靈感流通，同時尊重他人的權利。

## 菜單上有什麼？

- [揚帆啟航](#%E6%8F%9A%E5%B8%86%E5%95%9F%E8%88%AA)
  - [怎麼安裝 Fish？](#%E6%80%8E%E9%BA%BC%E5%AE%89%E8%A3%9D-fish)
  - [讓 Fish 成為你的預設殼層，Ahoy！](#%E8%AE%93-fish-%E6%88%90%E7%82%BA%E4%BD%A0%E7%9A%84%E9%A0%90%E8%A8%AD%E6%AE%BC%E5%B1%A4ahoy)
  - [尋找 Fish 的安裝位置](#%E5%B0%8B%E6%89%BE-fish-%E7%9A%84%E5%AE%89%E8%A3%9D%E4%BD%8D%E7%BD%AE)
  - [尋求幫助之處](#%E5%B0%8B%E6%B1%82%E5%B9%AB%E5%8A%A9%E4%B9%8B%E8%99%95)
- [基礎](#%E5%9F%BA%E7%A4%8E)
  - [提示字元解密：這些扭曲的字元是什麼？](#%E6%8F%90%E7%A4%BA%E5%AD%97%E5%85%83%E8%A7%A3%E5%AF%86%E9%80%99%E4%BA%9B%E6%89%AD%E6%9B%B2%E7%9A%84%E5%AD%97%E5%85%83%E6%98%AF%E4%BB%80%E9%BA%BC)
  - [我在哪？得到目前所在路徑](#%E6%88%91%E5%9C%A8%E5%93%AA%E5%BE%97%E5%88%B0%E7%9B%AE%E5%89%8D%E6%89%80%E5%9C%A8%E8%B7%AF%E5%BE%91)
  - [搜尋和執行命令：該怎麼做？](#%E6%90%9C%E5%B0%8B%E5%92%8C%E5%9F%B7%E8%A1%8C%E5%91%BD%E4%BB%A4%E8%A9%B2%E6%80%8E%E9%BA%BC%E5%81%9A)
  - [我的命令執行成功了嗎？](#%E6%88%91%E7%9A%84%E5%91%BD%E4%BB%A4%E5%9F%B7%E8%A1%8C%E6%88%90%E5%8A%9F%E4%BA%86%E5%97%8E)
  - [Fish Shebang 是什麼？讓腳本可以被執行](#fish-shebang-%E6%98%AF%E4%BB%80%E9%BA%BC%E8%AE%93%E8%85%B3%E6%9C%AC%E5%8F%AF%E4%BB%A5%E8%A2%AB%E5%9F%B7%E8%A1%8C)
  - [怎麼互動式地除錯 Fish 腳本？斷點](#%E6%80%8E%E9%BA%BC%E4%BA%92%E5%8B%95%E5%BC%8F%E5%9C%B0%E9%99%A4%E9%8C%AF-fish-%E8%85%B3%E6%9C%AC%E6%96%B7%E9%BB%9E)
  - [Fish 的 `.bash_profile` 或 `.bashrc` 等價物呢？](#fish-%E7%9A%84-bash_profile-%E6%88%96-bashrc-%E7%AD%89%E5%83%B9%E7%89%A9%E5%91%A2)
- [關於變數的那些事](#%E9%97%9C%E6%96%BC%E8%AE%8A%E6%95%B8%E7%9A%84%E9%82%A3%E4%BA%9B%E4%BA%8B)
  - [怎麼設定一個變數？變數作用域快速導覽](#%E6%80%8E%E9%BA%BC%E8%A8%AD%E5%AE%9A%E4%B8%80%E5%80%8B%E8%AE%8A%E6%95%B8%E8%AE%8A%E6%95%B8%E4%BD%9C%E7%94%A8%E5%9F%9F%E5%BF%AB%E9%80%9F%E5%B0%8E%E8%A6%BD)
  - [怎麼導出變數](#%E6%80%8E%E9%BA%BC%E5%B0%8E%E5%87%BA%E8%AE%8A%E6%95%B8)
  - [怎麼列出環境變數](#%E6%80%8E%E9%BA%BC%E5%88%97%E5%87%BA%E7%92%B0%E5%A2%83%E8%AE%8A%E6%95%B8)
  - [怎麼永久地新增路徑到 `$PATH`？](#%E6%80%8E%E9%BA%BC%E6%B0%B8%E4%B9%85%E5%9C%B0%E6%96%B0%E5%A2%9E%E8%B7%AF%E5%BE%91%E5%88%B0-path)
  - [怎麼從 `$PATH` 移除路徑？](#%E6%80%8E%E9%BA%BC%E5%BE%9E-path-%E7%A7%BB%E9%99%A4%E8%B7%AF%E5%BE%91)
  - [怎麼永久地從 `$PATH` 移除路徑？](#%E6%80%8E%E9%BA%BC%E6%B0%B8%E4%B9%85%E5%9C%B0%E5%BE%9E-path-%E7%A7%BB%E9%99%A4%E8%B7%AF%E5%BE%91)
  - [怎麼確定 `$PATH` 中是否有某個路徑？](#%E6%80%8E%E9%BA%BC%E7%A2%BA%E5%AE%9A-path-%E4%B8%AD%E6%98%AF%E5%90%A6%E6%9C%89%E6%9F%90%E5%80%8B%E8%B7%AF%E5%BE%91)
- [關於函式的那些事](#%E9%97%9C%E6%96%BC%E5%87%BD%E5%BC%8F%E7%9A%84%E9%82%A3%E4%BA%9B%E4%BA%8B)
  - [怎麼創建一個函式？](#%E6%80%8E%E9%BA%BC%E5%89%B5%E5%BB%BA%E4%B8%80%E5%80%8B%E5%87%BD%E5%BC%8F)
  - [怎麼創建一個「私人」函式？](#%E6%80%8E%E9%BA%BC%E5%89%B5%E5%BB%BA%E4%B8%80%E5%80%8B%E7%A7%81%E4%BA%BA%E5%87%BD%E5%BC%8F)
  - [函式名稱和檔案名稱應該一致嗎？](#%E5%87%BD%E5%BC%8F%E5%90%8D%E7%A8%B1%E5%92%8C%E6%AA%94%E6%A1%88%E5%90%8D%E7%A8%B1%E6%87%89%E8%A9%B2%E4%B8%80%E8%87%B4%E5%97%8E)
  - [可以將多個函式放到單一檔案中嗎？](#%E5%8F%AF%E4%BB%A5%E5%B0%87%E5%A4%9A%E5%80%8B%E5%87%BD%E5%BC%8F%E6%94%BE%E5%88%B0%E5%96%AE%E4%B8%80%E6%AA%94%E6%A1%88%E4%B8%AD%E5%97%8E)
  - [怎麼揭露函式的定義？](#%E6%80%8E%E9%BA%BC%E6%8F%AD%E9%9C%B2%E5%87%BD%E5%BC%8F%E7%9A%84%E5%AE%9A%E7%BE%A9)
  - [探索函式、內建命令、和系統命令](#%E6%8E%A2%E7%B4%A2%E5%87%BD%E5%BC%8F%E5%85%A7%E5%BB%BA%E5%91%BD%E4%BB%A4%E5%92%8C%E7%B3%BB%E7%B5%B1%E5%91%BD%E4%BB%A4)
  - [顯示函式名冊](#%E9%A1%AF%E7%A4%BA%E5%87%BD%E5%BC%8F%E5%90%8D%E5%86%8A)
  - [檢查函式是否存在](#%E6%AA%A2%E6%9F%A5%E5%87%BD%E5%BC%8F%E6%98%AF%E5%90%A6%E5%AD%98%E5%9C%A8)
- [關於引數的那些事](#%E9%97%9C%E6%96%BC%E5%BC%95%E6%95%B8%E7%9A%84%E9%82%A3%E4%BA%9B%E4%BA%8B)
  - [存取函式引數](#%E5%AD%98%E5%8F%96%E5%87%BD%E5%BC%8F%E5%BC%95%E6%95%B8)
  - [存取腳本引數](#%E5%AD%98%E5%8F%96%E8%85%B3%E6%9C%AC%E5%BC%95%E6%95%B8)
  - [解析命令列引數](#%E8%A7%A3%E6%9E%90%E5%91%BD%E4%BB%A4%E5%88%97%E5%BC%95%E6%95%B8)
- [關於別名的那些事](#%E9%97%9C%E6%96%BC%E5%88%A5%E5%90%8D%E7%9A%84%E9%82%A3%E4%BA%9B%E4%BA%8B)
  - [定義別名的藝術](#%E5%AE%9A%E7%BE%A9%E5%88%A5%E5%90%8D%E7%9A%84%E8%97%9D%E8%A1%93)
  - [在 `config.fish` 中定義別名的問題](#%E5%9C%A8-configfish-%E4%B8%AD%E5%AE%9A%E7%BE%A9%E5%88%A5%E5%90%8D%E7%9A%84%E5%95%8F%E9%A1%8C)
- [IO](#io)
  - [讀取檔案](#%E8%AE%80%E5%8F%96%E6%AA%94%E6%A1%88)
  - [讀取 stdin 並像專家一樣重導向](#%E8%AE%80%E5%8F%96-stdin-%E4%B8%A6%E5%83%8F%E5%B0%88%E5%AE%B6%E4%B8%80%E6%A8%A3%E9%87%8D%E5%B0%8E%E5%90%91)
  - [精通重導向](#%E7%B2%BE%E9%80%9A%E9%87%8D%E5%B0%8E%E5%90%91)
- [並行：讓魚兒游得更快](#%E4%B8%A6%E8%A1%8C%E8%AE%93%E9%AD%9A%E5%85%92%E6%B8%B8%E5%BE%97%E6%9B%B4%E5%BF%AB)
  - [在背景執行命令](#%E5%9C%A8%E8%83%8C%E6%99%AF%E5%9F%B7%E8%A1%8C%E5%91%BD%E4%BB%A4)
  - [檢查背景作業](#%E6%AA%A2%E6%9F%A5%E8%83%8C%E6%99%AF%E4%BD%9C%E6%A5%AD)
  - [像專家一樣同步背景工作](#%E5%83%8F%E5%B0%88%E5%AE%B6%E4%B8%80%E6%A8%A3%E5%90%8C%E6%AD%A5%E8%83%8C%E6%99%AF%E5%B7%A5%E4%BD%9C)
- [詞彙表](#%E8%A9%9E%E5%BD%99%E8%A1%A8)
- [貢獻](#%E8%B2%A2%E7%8D%BB)

## 揚帆啟航

Ahoy！準備好和我們最好的夥伴 Fish 展開一場偉大的冒險了嗎？在這節中，我們將手把手指引你設置，確保你準備好像真正的船長一樣在命令列的海洋中航行。讓我們整裝待發，迎接前方的旅途！

### 怎麼安裝 Fish？

如果你準備好深入 Fish 的美妙世界了，這裡可以教你怎麼「出海」。你可以按照[官方網站](https://fishshell.com)的說明，或根據你的作業系統沿著我們提供的航線前行。

**裝有 Homebrew 的 macOS：**

```bash
brew update && brew install fish
```

**Debian：**

```bash
wget http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key
apt-key add - < Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```

**Ubuntu：**

```bash
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
```

**CentOS：**

```bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish
```

**Fedora：**

```bash
dnf install fish
```

**Arch Linux：**

```bash
pacman -S fish
```

**Gentoo：**

```bash
emerge fish
```

**FreeBSD：**

```bash
pkg install fish
```

**NetBSD：**

```bash
pkgin install fish
```

**OpenBSD：**

```bash
pkg_add fish
```

**想從原始碼建置的勇者：**

```bash
sudo apt-get -y install git gettext automake autoconf ncurses-dev build-essential libncurses5-dev

git clone -q --depth 1 https://github.com/fish-shell/fish-shell
cd fish-shell
autoreconf && ./configure
make && sudo make install
```

安裝好 Fish 後，驚心動魄的旅程就在不遠處了，快準備好探索命令列、挖掘 Fish 的核心寶藏與秘密。敬豐收和喜悅，乾杯！🍻

### 讓 Fish 成為你的預設殼層，Ahoy！

只要你安裝 Fish 到你的 `$PATH` 了，例如到 /usr/local/bin，你可以將其設為預設殼層，以一帆風順地體驗命令列。

```fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

### 尋找 Fish 的安裝位置

好奇 Fish 安裝到哪裡去了？利用 [`which`](https://linux.die.net/man/1/which) 命令。

```fish
which fish
/usr/local/bin/fish
```

### 尋求幫助之處

如果你發現自己需要協助，或對 Fish 有所疑問，不用擔心，這裡有一座資源寶庫等著你：

- [官方儲存庫](https://github.com/fish-shell/fish-shell)——探索 GitHub 上的官方 Fish 儲存庫，那裡可以找到原始碼和貢獻專案。
- [教學](https://fishshell.com/docs/current/tutorial.html)——按照一步步講解的 Fish 教學揚帆啟航，精通各種特性與功能。
- [文件](https://fishshell.com/docs/current/index.html)——深入 Fish 官方文件，在那你會發現大量資訊和指南。
- [`r/fishshell`](https://www.reddit.com/r/fishshell)——加入 Reddit 上的社群，「魚友」聚集於此分享他們的知識與歷險。
- [Gitter 頻道](https://gitter.im/fish-shell/fish-shell)——登上 Gitter 頻道，在這個聊天平台可以與其他 Fish 使用者互動並找到幫助。
- [StackOverflow `#fish`](https://stackoverflow.com/questions/tagged/fish)——為問題標上 `#fish` 標籤，投向 StackOverflow 之海，你將收到來自廣闊程式社群的引導。
- [awsm.fish](https://git,io/awsm.fish)——找尋一系列精選的提示字元、插件、和其他隱藏的珍寶，來強化你的 Fish 之旅。

## 基礎

### 提示字元解密：這些扭曲的字元是什麼？

提示字元是你敲打命令、和 Fish 互動的地方。更多有關 UNIX 提示字元的資訊在[此](https://en.wikipedia.org/wiki/Command-line_interface#Command_prompt)。

你可能會遇到像這樣的東西：

```console
jb@mbp ~/C/cookbook>
```

波浪號（`~`）代表[家目錄](http://www.linfo.org/home_directory.html)，但比起 `/users/jb/home` 或 `/Users/jb` 之類的更簡短。

`@` 符號則只是用來分隔使用者名稱 `jb` 與電腦的名稱 `mbp`，你可以學習定製提示字元來顯示你想要的東西。

斜線（`/`）分隔了路徑。可以看出目前位於家目錄中的 `Code/cookbook` 下，但縮寫路徑只會顯示 `C`。

要改變縮寫路徑的長度，使用：

```fish
set fish_prompt_pwd_dir_length NUMBER
```

或者，你偏好不要縮寫的話：

```fish
set fish_prompt_pwd_dir_length 0
```

那麼你的提示字元看起來會像：

```console
jb@mbp ~/Code/cookbook>
```

大於號（`>`）標示了提示字元的結尾。

不太喜歡這些慣例？隨意製作你自己的提示字元吧！

### 我在哪？得到目前所在路徑

在 Fish 中要得到目前位置，只要用唯讀環境變數 `$PWD` 就好。

```fish
echo $PWD
/Users/jb/Code/cookbook
```

你也可以用 `pwd` 內建命令來確定目前在哪個目錄下：

```fish
pwd
/Users/jb/Code/cookbook
```

Fish 的 `$PWD` 和 `pwd` 皆會解析符號連結。也就是說，如果你所在的目錄是對另一個目錄的參考，你得到的會是真正目錄的路徑。

在交互介面中 `pwd` 更為方便，但對於腳本使用 `$PWD` 成本更低。

### 搜尋和執行命令：該怎麼做？

執行命令只需要輸入命令名稱，然後按下回車鍵（譯註：原文為「return」，指「carriage return」，即鍵盤上可能標為「Enter」的鍵）。

```fish
ls
```

你也可以輸入幾個字母後按下製表鍵（Tab），Fish 內建的「pager」會列出可能的命令供你選擇。

Fish 靠環境變數 `$PATH` 找到命令，其包含數個路徑，每個路徑中的可執行檔案都可以直接用名字執行。

顯示 `$PATH` 的內容：

```fish
printf "%s\n" $PATH
/usr/local/bin
/usr/bin
/bin
```

列出所有命令並以直行顯示：

```fish
ls $PATH | column
```

如果列表長到被截斷了，試試看改用：

```fish
ls $PATH | column | less
```

用 `k` 和 `j` 上下捲動，按下 `q` 退出。

Fish 在行程剛開始時的環境初始化中會創建 `$PATH` 變數，你可以在 `~/.config/fish/config.fish` 中修改、

除了內建命令 `type`、`builtin`、`functions`，\*nix 作業系統通常還有一些殼層無關的命令如 `which`、`apropos`、`whatis` 等。

這些命令有些相同的功能，但也有不同之處。詳情請見你系統的首冊頁。

### 我的命令執行成功了嗎？

所有命令都會回傳一個**退出碼**，來指示成功與否。0 代表成功，其他數值則意味著失敗。各個命令用各不相同的整數來表示可能的錯誤。

在 Fish 中，你可以使用唯讀變數 `$status` 來檢查上一個命令是否成功。

```fish
my_command
echo $status
```

當使用管線時，則可以用 `$pipestatus` 來檢查管線中各命令的退出碼。

假設你用了像這樣的管線：

```fish
command1 | command2 | command3
```

你可以從 `$pipestatus` 中得到管線中所有命令的退出碼：

```fish
echo $pipestatus
```

上面的命令會印出一組對應到管線中各個命令的退出碼。例如，如果 `command1` 成功了，`command2` 以代碼 2 失敗，`command3` 以代碼 1 失敗，那麼輸出會像：

```
0 2 1
```

透過 `$pipestatus`，你可以方便地得知管線中各命令的狀態。

### Fish Shebang 是什麼？讓腳本可以被執行

[shebang](https://zh.wikipedia.org/zh-tw/Shebang) 是一種特殊的註解，用以告訴殼層使用特定程式執行腳本。

要預設使用 `fish` 執行腳本，將 shebang 加到檔案的第一行：

```fish
#!/usr/bin/env fish
```

<details>
<summary>來點獨家新聞！</summary>

```fish
#!/usr/bin/env fish

if status --is-interactive
    echo "我們活在互動式的世界！"
end
```

將以上程式碼儲存到一個檔案，並將其標記為可執行。

```fish
chmod +x my_script
```

shebang 讓你可以直接用檔案路徑執行腳本：

```fish
./my_script
```

而不用：

```fish
fish my_script
```

</details>

### 怎麼互動式地除錯 Fish 腳本？斷點

內建命令 [`breakpoint`](https://fishshell.com/docs/current/cmds/breakpoint.html) 可以讓你輕鬆除錯你的 Fish 腳本，只要放到腳本中任何你想要暫停執行並開啟互動式除錯提示字元的地方就好：

```fish
function some_function
    set --local files (ls ~)
    breakpoint # 當執行到這時，會開啟互動式提示字元，你可以在其中檢查 $files。
    # ... 函式剩餘的部分不會執行，直到你退出除錯器。
end
```

依靠 `breakpoint`，你可以更仔細地觀察腳本的執行、檢查變數，並在腳本中航行。

### Fish 的 `.bash_profile` 或 `.bashrc` 等價物呢？

在 Fish，你的組態儲存於 `~/.config/fish/config.fish`，這個檔案相當於 Bash 的 `.bash_profile` 或 `.bashrc`。這允許你透過新增函式、環境變數、和其他個人化設定，來自訂和配置你的 Fish 環境。

## 關於變數的那些事

### 怎麼設定一個變數？變數作用域快速導覽

使用內建命令 [`set`](https://fishshell.com/docs/current/cmds/set.html) 來設定變數。

```fish
set foo 42
```

可以用以下選項顯式宣告變數的作用域：

- `-l`、`--local`：只作用於最內層的區塊。
- `-g`、`--global`：作用於所在的區塊和函式之外。
- `-U`、`--universe`：在 Fish 會話之間通用，並在 Fish 關閉時持續存在。
- `-x`、`--export`：作用於目前會話產生的子行程。

如果沒有宣告作用域，預設情況下只作用於所在的函式，或是全域（如果不是在函式中設定）。

如果該變數先前已定義，會使用當時的作用域。

#### 區域變數

`foo` 只作用於設定它的 `if` 區塊。

```fish
if true
    set -l foo 42
end

echo "foo=$foo" # foo=
```

#### 全域變數

`foo` 也作用於設定它的 `if` 區塊外。

```fish
if true
    set -g foo 42
end

echo "foo=$foo" # foo=42
```

#### 通用變數

`foo` 將被保留，並且作用於未來的其他會話。

```fish
set -U foo 42
fish
echo "foo=$foo" # foo=42
```

#### 導出變數

`foo` 是區域變數，且亦作用於 `if` 區塊中創建的 `fish` 子行程。

```fish
if true
    set -lx foo 42
    fish -c 'echo "foo=$foo"' # foo=42
end
```

第二個例子中，`foo` 是全域變數，但沒有導出，無法作用於子行程。

```fish
set -g foo 42
fish -c 'echo "foo=$foo"' # foo=
```

第三個例子中，`GPG_AGENT_INFO` 是通用變數且已導出，所以會被保留並作用於未來的會話和子行程。

```fish
set -Ux GPG_AGENT_INFO /Users/jb/.gnupg/S.gpg-agent:12345:2
```

### 怎麼導出變數

使用帶 `-x` 或 `--export` 作用域修飾符的 [`set`](https://fishshell.com/docs/current/cmds/set.html) 來導出變數。

```fish
set -x foo 42
fish -c 'echo "foo=$foo"' # foo=42
```

由於 `-x` 和 `--export` 選項，變數會作用於目前會話產生的子行程。

### 怎麼列出環境變數

要列出所有環境變數，可以用不帶任何引數的 [`set`](https://fishshell.com/docs/current/cmds/set.html)。

```fish
set
```

如果你希望只列出變數名稱，而不包含其值，加上 `--names` 選項：

```fish
set --names
```

想看到完整內容，而不截斷太長的行，用 `--long`：

```fish
set --long
```

### 怎麼永久地新增路徑到 `$PATH`？

要永久地新增路徑到 `$PATH`，確保你用的是 `$fish_user_paths`。

```fish
set -U fish_user_paths $fish_user_paths my_path
```

如果你用的是 Fish 3.2.1 或以上，可以改用內建命令 `fish_add_path`。

```fish
fish_add_path my_path
```

> 官方教學的 [`$PATH`](https://fishshell.com/docs/current/tutorial.html#path) 中有豐富的資訊。

### 怎麼從 `$PATH` 移除路徑？

要從 `$PATH` 移除路徑，用帶 `-e` 或 `--erase` 的 [`set`](https://fishshell.com/docs/current/cmds/set.html)，加上內建命令 [`contains`](https://fishshell.com/docs/current/cmds/contains.html) 以找到要移除的路徑的索引值。

```fish
if set -l index (contains -i $my_path $PATH)
    set -e PATH[$index]
end
```

### 怎麼永久地從 `$PATH` 移除路徑？

要永久地從 `$PATH` 移除路徑，用帶 `-e` 或 `--erase` 的 [`set`](https://fishshell.com/docs/current/cmds/set.html)，加上內建命令 [`contains`](https://fishshell.com/docs/current/cmds/contains.html) 以從 `$fish_user_paths` 找到要移除的路徑的索引值。

```fish
if set -l index (contains -i $my_path $fish_user_paths)
    set -e -U fish_user_paths[$index]
end
```

### 怎麼確定 `$PATH` 中是否有某個路徑？

要確定 `$PATH` 中是否有某個路徑，用內建命令 [`contains`](https://fishshell.com/docs/current/cmds/contains.html)。這個方便的工具可以檢查路徑是否包含在 `$PATH` 中與其他路徑一起悠游。🐠

```fish
if contains $my_path $PATH
    # $PATH 中有 $my_path。
end
```

## 關於函式的那些事

### 怎麼創建一個函式？

在 Fish 中定義函式簡直是小菜一碟！只要用內建命令 [`function`](https://fishshell.com/docs/current/cmds/function.html) 就能開始創作你的傑作。

```fish
function mkdirp
    mkdir -p $argv
end
```

為了保持這個函式在未來的會話仍新鮮可用，需將其儲存至 ~/.config/fish/functions/mkdirp.fish。一個簡單的方法是用 [`funcsave`](https://fishshell.com/docs/current/cmds/funcsave.html) 函式。

```fish
funcsave mkdirp
```

或者用內建命令 [`functions`](https://fishshell.com/docs/current/cmds/functions.html) 將函式定義（就像你的獨家命令秘方）寫到檔案中。

```fish
functions mkdirp > ~/.config/fish/functions/mkdirp.fish
```

### 怎麼創建一個「私人」函式？

Fish 並沒有內建的私人函式功能，但你仍然可以躡手躡腳地創建函式。想一個命名空間作為函式名稱的前綴吧！

```fish
function _prefix_my_function
end
```

你也可以用 [`functions -e`](https://fishshell.com/docs/current/cmds/functions.html) 模擬作用域。

<details>
<summary>展示一些秘密醬料！</summary>

```fish
function foo
    function _foo
        echo Foo
        functions -e _foo # 消除 _foo。
    end
    _foo
end
```

</details>

這個方法可以幫你保密函式，就好像你配方中的絕密成分。

### 函式名稱和檔案名稱應該一致嗎？

必須一致！Fish 的[惰性載入／自動載入](https://fishshell.com/docs/current/tutorial.html#autoloading-functions)機制依賴於天衣無縫的一致名稱。

如果你的 ~/.config/fish/functions/foo.fish 包含有效的函式 `bar`：

1. 在新的殼層中，嘗試執行 `bar` 會導致未知命令的錯誤。
2. 輸入 `foo` 會高亮為一個有效的命令，但會導致未知命令的錯誤。
3. 再試一次 `bar`，現在它可以運作了，就像魔法一樣。

<details>
<summary>魔術表演！</summary>

將 `bar` 存入 ~/.config/fish/functions/foo.fish。

```fish
function bar
    echo Bar
end
functions bar > ~/.config/fish/functions/foo.fish
```

創建一個新的會話。

```fish
fish
```

嘗試執行 `bar`，然後是 `foo`，然後再一次 `bar`。

```fish
bar
# fish: Unknown command 'bar'
foo
# fish: Unknown command 'foo'
bar
# Bar
```

</details>

### 可以將多個函式放到單一檔案中嗎？

當然可以！你可以在一個檔案中定義任意數量的函式。但要記住，Fish 沒有私有函式，因此在檔案載入後，每個函式都會是全域的。

由於函式是急切加載的，一檔多函式可能不會和一檔一函式一樣有效率，後者利用了 Fish 的自動載入功能。所以儘管可以做到一檔多函式，把它們放到不同檔案中可能能提升效能並使結構更有條理。

### 怎麼揭露函式的定義？

如果你確定你要找的命令是函式，你可以用 [`functions`](https://fishshell.com/docs/current/cmds/functions.html) 內建命令查看其定義：

```fish
functions my_function
```

並且，假如你不知道那個命令是函式、內建命令、還是系統命令，你可以用 [`type`](https://fishshell.com/docs/current/cmds/type.html) 來揭開它的本質。

```fish
type my_function
my_function is a function with definition
# ... 函式定義 ...
```

你可以用 `type` 輕易辨認命令的種類，並得到你需要的資訊。

### 探索函式、內建命令、和系統命令

函式、內建命令、系統命令是以不同方式定義的，而它們各有用途：

- 函式：使用者在 Fish 中定義的命令。有一些函式預先定義好作為 Fish 的一部分分發，例如 [`alias`](https://fishshell.com/docs/current/cmds/alias.html)、[`type`](https://fishshell.com/docs/current/cmds/type.html)、以及 [`nextd`](https://fishshell.com/docs/current/cmds/nextd.html)。

- 內建命令：被編譯到 Fish 可執行檔中的命令。和函式類似，內建命令能存取環境，但不會產生一個子行程，所以可以執行得更快、更低開銷。例子包含 [`functions`](https://fishshell.com/docs/current/cmds/functions.html) 和 [`set`](https://fishshell.com/docs/current/cmds/set.html)。

- 系統命令：[`$PATH`](https://fishshell.com/docs/current/tutorial.html#path) 中列出的目錄裡的可執行的腳本、二進位檔案，或指向它們的符號連結。執行命令時，其會是一個子行程，且只能存取導出的變數。例如 `fish`。

多種種類的命令有助於使 Fish 如此強大而靈活，能夠進行廣泛的自訂。

### 顯示函式名冊

使用不帶引數的 [`functions`] 內建命令，來列出 Fish 中所有函式。注意，隱藏函式——以底線開頭的函式——不會顯示。如果要列出包含隱藏者的所有函式的話，要用 `functions -a` 或 `functions --all`。

另一個方法是，透過以下命令，啟動基於 web 的 Fish 組態，並導航到 /functions 分頁：

```fish
fish_config functions
```

### 檢查函式是否存在

[`type`](https://fishshell.com/docs/current/cmds/type.html) 函式是檢查一個函式是否存在的首選工具。它提供有關函式、內建命令、或系統命令的資訊。

```fish
if not type --quiet "$command_name"
    exit 1
end
```

<details>
<summary><a href="https://fishshell.com/docs/current/cmds/functions.html"><code>functions --query</code></a> 專用於函式。</summary>

```fish
if not functions --query "$command_name"
    exit 1
end
```

</details>

<details>
<summary><a href="https://fishshell.com/docs/current/cmds/builtin.html"><code>builtin --names</code></a> 專用於內建命令</summary>

```fish
if not contains -- "$command_name" (builtin --names)
    exit 1
end
```

</details>

<details>
<summary><a href="https://fishshell.com/docs/current/cmds/command"><code>command --search</code></a> 專用於系統命令</summary>

```fish
if not command --search "$command_name" > /dev/null
    exit 1
end
```

Fish 2.5 或以上中更為簡單：

```fish
if not command --search --quiet "$command_name"
    exit 1
end
```

</details>

## 關於引數的那些事

### 存取函式引數

`$argv` 變數提供了傳入函式的引數。

```fish
function Foo
    printf "%s\n" $argv
end

Foo foo bar baz
foo
bar
baz
```

### 存取腳本引數

要存取傳入腳本的引數，用……嗯，對，`$argv`。

```fish
fish ./my_script foo bar baz
foo
bar
baz
```

<details>
<summary>範例：my_script</summary>

```fish
#!/usr/bin/env fish
printf "%s\n" $argv
```

</details>

### 解析命令列引數

你可以用 [`for`](https://fishshell.com/docs/current/cmds/for.html) 迴圈來解析命令列引數。

```fish
for option in $argv
    switch "$option"
        case -f --foo
        case -b --bar
        case \*
            printf "錯誤：未知的選項 %s\n" $option
    end
end
```

有關更多強大的解析方法，可以研究 [`argparse`](https://fishshell.com/docs/current/cmds/argparse.html) 內建命令。另一個選擇是使用 [`getopts`](https://github.com/jorgebucaran/getopts.fish)，這是一種不同的 CLI 引數解析方案。

## 關於別名的那些事

### 定義別名的藝術

Fish 提供 [`alias`](https://fishshell.com/docs/current/cmds/alias.html) 函式來創建方便的別名：

```fish
alias rimraf "rm -rf"
```

相當於創建一個像這樣的函式：

```fish
function rimraf --wraps='rm -rf' --description 'alias rimraf rm -rf'
  rm -rf $argv;
end
```

不過用 `alias` 創建的別名不會作用於新的會話。如果要讓其持續存在，用：

```fish
alias -s ...
```

將別名儲存至 `~/.config/fish/functions/[別名名稱].fish`。

### 在 `config.fish` 中定義別名的問題

在 `~/.config/fish/config.fish` 中定義別名會使殼層在啟動時變慢，因為每個別名（函式）都會急切載入。

如果要在會話間保留別名，應該用 `alias -s`，來創建一個函式並儲存其至 `~/.config/fish/functions`。如此一來，便能利用 Fish 的函式[惰性載入／自動載入](https://fishshell.com/docs/current/tutorial.html#autoloading-functions)機制。

## IO

### 讀取檔案

[`read`](https://fishshell.com/docs/current/cmds/read.html) 內建命令能夠優雅地逐行讀取檔案。

```fish
while read -la line
    echo $line
end < my_file
```

### 讀取 stdin 並像專家一樣重導向

要讀取 stdin，[`read`](https://fishshell.com/docs/current/cmds/read.html) 內建命令是你最好的工具。

```fish
read --prompt "echo 'Name: ' " -l name
```

```
Name: Flipper
```

```fish
echo $name
Flipper
```

結合 `read` 與 [`while`](https://fishshell.com/docs/current/cmds/while.html) 內建命令，便能讀取任意輸入流。

```fish
while read -la line
    echo $line
end
```

### 精通重導向

重導向 stderr 至 `$my_file`：

```fish
my_command 2> $my_file
```

重導向 stdout 至 stderr：

```fish
my_command >&2
```

重導向 stderr 至 stdout：

```fish
my_command 2>&1
```

## 並行：讓魚兒游得更快

### 在背景執行命令

簡單的一個 `&` 就可以讓 Fish 在背景執行命令。

```fish
sleep 10 &
```

### 檢查背景作業

[`jobs`](https://fishshell.com/docs/current/cmds/jobs.html) 內建命令能夠查看是否有背景作業。

```fish
if jobs > /dev/null
    echo Busy
end
```

### 像專家一樣同步背景工作

Fish `3.0.0` 加入了 [`wait`](https://fishshell.com/docs/current/cmds/wait.html)，用以簡單地同步背景工作。但如果你好奇在沒有 `wait` 時要怎麼做，這裡也有一份懷舊配方。

首先，檢查是否有工作在背景執行，解析 [`jobs`](https://fishshell.com/docs/current/cmds/jobs.html) 內建命令的輸出。

<details>
<summary>按作業 ID 解析</summary>

```fish
function get_jobs
    jobs $argv | command awk -v FS=\t '
        /[0-9]+\t/{
            jobs[++nJobs] = $1
        }
        END {
            for (i in jobs) {
                print(jobs[i])
            }
            exit nJobs == 0
        }
    '
end
```

</details>

<details>
<summary>按群組 ID 解析</summary>

```fish
function get_jobs
    jobs -g | command awk 'NR > 0 { print; i++ } END { exit i == 0 }'
end
```

</details>

接著，阻塞前景，直到所有背景作業結束。

```fish
function wait
    while true
        set -l has_jobs
        set -l all_jobs (get_jobs)
        or break

        for j in $argv
            if contains -- $j $all_jobs
                set -e has_jobs
                break
            end
        end

        if set -q has_jobs
            break
        end
    end
end
```

這是我們的程式的範例：

```fish
set -l urls "https://"{google,twitter,youtube,facebook,github}".com"

for url in $urls
    fish -c "curl -Lw \"$url: %{time_total}s\n\" -o /dev/null -s $url" &
end

wait (get_jobs)
```

## 詞彙表

以下是在《Fish 食譜》中提到的術語與概念表：

- **Fish**：Fish，「Friendly Interactive Shell」的縮寫，一個類 Unix 作業系統的命令列殼層。以使用者友善的功能、語法高亮、自動建議、強大的腳本能力等聞名。

- **安裝 Fish**：包括在你的系統上獲取 Fish 並設置好的安裝過程。你可以用套件管理器安裝，或從原始碼建置。

- **預設殼層**：預設殼層會在你開啟終端或登入到系統時自動啟動。將 Fish 設為你的預設殼層可確保你預設會和 Fish 互動。

- **Fish 組態**：Fish 組態包括自訂 Fish 的行為和外觀。組態可以在 `config.fish` 中設定，該檔案會在 Fish 啟動時載入。

- **變數**：變數用以儲存和操作資料，可以儲存字串、數字、或其他資料。變數可以在 Fish 腳本和互動式會話中定義、賦值、存取。

- **函式**：函式能夠用一個名稱將一串命令統整起來。函式可以用 `function` 關鍵字定義，並用其名稱呼叫。

- **IO（Input/Output，輸入／輸出）**：IO 指殼層的輸入和輸出操作。Fish 提供了多個命令和技巧用以讀取檔案、重導向輸出、和處理輸入流。

- **並行**：並行在 Fish 中指同時執行命令或工作。Fish 允許你在背景執行命令、檢查背景作業的狀態、同步工作、等待背景行程結束。

這些術語提供了對《Fish 食譜》涵蓋的關鍵概念的高階理解。請參閱文件中對應的章節以獲取更多詳細資訊與實際示例。

## 貢獻

Ahoy！我們對你為《Fish 食譜》的歷險登上甲板感到興奮！你的貢獻將造就這本食譜，成為一份對 Fish 社群有價值的資源。所以，一頭栽進去吧！但記得遵守以下規範。

你可以以幾種方式貢獻這本食譜：

- **加入新配方**：如果你有有用的 Fish 配方或麻煩問題的聰明解法，你可以透過將新配方加到此儲存庫來分享知識。只需確保你的配方遵循既定的結構並提供清晰的指示即可。讓我們一同將這本食譜變得更多樣與美味吧！

- **增強現有配方**：如果你發現一個配方可以變得更好，你可以伸出援手來改善它。優化內容、增加更多資訊、修正錯誤、或微調程式碼。一起打磨拋光這些配方！

- **使食譜不會過時**：Fish 正在持續進化，會定期發佈新功能與更新。透過辨認過時內容、標示新功能與改變、更新現有配方，幫助我們確保食譜保持最新。我們維護的將會是為所有人撰寫的、寶貴的最新資源。

要成為水手之一，並為食譜做出貢獻，請跟隨規範的指引：

1. 揚帆啟航！分叉儲存庫，然後為你的貢獻創建新分支——一個可以盡情更改的安全空間。
2. 在新分支施展你的魔法。確保內容準確、清楚、遵循約定的結構。我們在同一條船上！
3. 如果你添加了新配方，挑一個引人入勝且淺顯易懂的標題。
4. 提交你的更改，並撰寫有意義的提交訊息，讓我們知道你做了什麼更改。最好像地圖一樣詳細！
5. 將你的分支推送到你分叉的儲存庫，就像船長為新的海域繪製地圖。
6. 對主儲存庫開啟一個 PR。分享你的更改背後的故事，以及為什麼它們有價值。我們知道得越多，就越能欣賞你的作品。

一旦你提交了 PR，我們值得信賴的維護者會進行審核。在升起旗幟、合併你的提交之前，他們可能會提供一些意見，或要求一些修改。

我們衷心感謝你幫助改進《Fish 食譜》。我們重視你的努力，並將攜手為 Fish 社群創造極好的資源。Ahoy！

<h2></h2>

[![CC0](https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-nc-sa.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0)
