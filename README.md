## 🐾Friends RISC-V

「Computer Organization and Design RISC-V Edition」（パタヘネ本）の説明で出てくる単一サイクルのRISC-Vサブセットを、「デジタル回路設計とコンピュータアーキテクチャ」（ハリス本）のVerilogによるMIPSの実装を参考にして実装しました。両教科書を元に学ぶことができます。


## 実行について  
Githubではsrcフォルダとtestフォルダに分けています。冊子の通り実行するには、ローカルPC上で一つのフォルダにまとめて実行してください。



## 冊子の正誤表
ここにお詫びして訂正いたします。読者の皆様には大変ご迷惑をお掛けしました。


|  訂正箇所  |  誤  |  正  | 備考
| ---- | ---- |
|8頁 15行目|  RV32F（単精度浮動小数点）、RV32F（倍精度浮動小数点）| RV32F（単精度浮動小数点）、RV32D（倍精度浮動小数点）||
|10頁 10行目|  エレルギーが少なくて済む  |エネルギーが少なくて済む||
|12頁 3行目の次|  （追加）  |imm   ：即値。イミディエイト||
|17頁 5行目| 即値で入力された値を2倍にして分岐しているのです。 |即値はハーフワード単位なのです。|*|
|17頁 5行目| 回路図で描くよりもテキストで記述した方が高いので |回路図で描くよりもテキストで記述した方が生産性が高いので||
|30頁 13行目| そして、always文のセンシビティリストは(*)なのです。 |そして、always文のセンシティビティリストは(*)なのです。||
|36頁 15行目| wite_data を書き込むのです。 |write\_data を書き込むのです。||
|52頁 4行目| レジスタファイルとALUのインスタンスを作成し、 |レジスタファイルとALUと即値生成ユニットのインスタンスを作成し、||
|54頁 最終行| なので単純に考えると、2の補数で、-2048〜2046byteの範囲に分岐できる |なのでバイト単位で考えると、2の補数で、-2048〜2047バイトの範囲に分岐できる||
|55頁 7行目の次| （追加） |（フェネック）ちょっと待ってよ。もともとbeqの即値はハーフワード単位の値が入っているわけさー。それを符号拡張して、改めてshift_left1するのって、無駄じゃないかな？<br>（アライさん）どういうことなのだ？<br>（フェネック）つまり、即値生成ユニットの段階で、immbを、<br>  assign imm_b = { {52{inst[31]}}, inst[7], inst[30:25], inst[11:8],1'b0 };<br>で取り出せば、ハーフワードの情報は損なわないし、改めてshift_left1を通す必要もないんじゃないのかなー。<br>（はかせ）フェネック、お前はかしこいのです。その通りなのです。|*|
|55頁 9行目| RISC-Vの命令長は32bit、 |RISC-Vの基本命令の命令長は32bit、|||



＊部分については、当方の未熟さにより、不正確な記述で大変ご迷惑をお掛けしました。追加を加え修正いたしました。B形式の即値はハーフワード単位ですが、サブセットでは符号拡張の際その情報が失われ、改めてshift_left1しています。パタヘネ本の図面でshift_left1が存在するのですが、なぜそのようになっているかについては、多分教育用のために強調されたのではと考えております。


３２ビット固定長命令を強調しすぎて、
## お知らせ
そのほかにも全般的に言葉のゆらぎ（ビットかbitかなど）があり、読みづらく申し訳ございません。電子版出版の際、物理本をご購入いただいた方向けに、無償ダウンロードをご用意いたします。


## 各種実装
数多くの実装が公開されています。  
* 本家サイト RISC-V Cores
https://riscv.org/risc-v-cores/
* 中国語のサイト　RISC-V資源列表
https://cnrv.io/resource
* カリフォルニア大学バークレー校 V-Scale(但し現在非推奨、廃止予定）
https://github.com/ucb-bar/vscale
* Western Digital社　
https://github.com/westerndigitalcorporation/swerv_eh1
