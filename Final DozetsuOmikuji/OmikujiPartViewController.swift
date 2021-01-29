//
//  OmikujiPartViewController.swift
//  Final DozetsuOmikuji
//
//  Created by Ryota Sakamoto on 2020/05/04.
//  Copyright © 2020 Ryota Sakamoto. All rights reserved.
//

import UIKit
import AVFoundation

class OmikujiPartViewController: UIViewController {
    
    //Scrollの為のUI変数
    @IBOutlet weak var scrollView: UIScrollView!
    
    //サウンド再生用
    var audioPlayer: AVAudioPlayer! = nil
    
    //ランダムに表示されるラベル
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unsei: UILabel!
    @IBOutlet weak var ganbou: UILabel!
    @IBOutlet weak var machibito: UILabel!
    @IBOutlet weak var usemono: UILabel!
    @IBOutlet weak var ryokou: UILabel!
    @IBOutlet weak var akinai: UILabel!
    @IBOutlet weak var gakumon: UILabel!
    @IBOutlet weak var souba: UILabel!
    @IBOutlet weak var arasoigoto: UILabel!
    @IBOutlet weak var renai: UILabel!
    @IBOutlet weak var tenkyo: UILabel!
    @IBOutlet weak var syussan: UILabel!
    @IBOutlet weak var byouki: UILabel!
    @IBOutlet weak var endan: UILabel!
    
    //その他ラベル
    @IBOutlet weak var lastLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクロールの長さ：横は画面と同じ、縦は1500ピクセル
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1500)
        
        //音の準備
        let soundFilePath = Bundle.main.path(forResource: "syakasyaka", ofType: "mp3")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("エラー")
        }
        audioPlayer.prepareToPlay()
    }
    
    @IBAction func uranaiTapped(_ sender: Any) {
        //おみくじの為のリスト集
        let omikuji_list = ["大吉", "中吉", "小吉", "吉", "凶", "大凶"]

        let negaigoto_list =
            [
            "叶うかもしれませんし、叶わないかもしれません",
            "叶うかどうかは正直願い事次第な気がします",
            "叶う可能性があるかもしれません。でも確証は全く御座いません",
            "正直我々は余り興味が御座いません",
            "100億円一括お賽銭に入れてくれたら叶う可能性が大アップ",
            "叶うといいですね、知ったこっちゃないですが"
            ]

        let machibito_list =
            [
            "待っている貴方は大変ですね、先方はとっくに忘れておりますが",
            "恐らく違うところで待っています",
            "恐らく今年は会えません、しかし諦めないでくださいませ、いつか会えます、来世までに",
            "待ちぼうけ",
            "時間を間違える",
            "マッチングサイトを使えば会える"
            ]

        let usemono_list =
            [
            "無くしたところにあります",
            "無くしたと気づくまでに時間が掛かりガチ",
            "失せる",
            "拾う",
            "既に換金されております",
            "曲者、見つかってもまだ失くします"
            ]

        let tabidachi_list =
            [
            "はよいきなされ",
            "ニートは即実行されよ",
            "勝手にすればよろし",
            "娘が嫁にいく、これに気づけるか否か",
            "しんどくなる",
            "めちゃめちゃしんどくなる"
            ]

        let akinai_list =
            [
            "上手くいくと税金を多く払う",
            "競合がめちゃくちゃ強い",
            "と書いてアキナイと読むかショウバイと読むかで今年の運勢が変わります",
            "畳む",
            "税金を払い忘れる、そして追従課税で苦しむ",
            "センス次第"
            ]
                  
        let gakumon_list =
            [
            "馬鹿は頑張っても馬鹿のまま",
            "本を買って読まずに積むだけ",
            "やる気が失せる",
            "頑張れば伸びるは嘘",
            "お金を掛けずに頑張れば手に入る、ただ多くの人はお金を掛ける事に逃げるでしょう",
            "解決方法等ない"
            ]

        let souba_list =
            [
            "引くほど暴落するか、有り得ない程暴騰する",
            "読めない、2つの意味で",
            "コンピューターアルゴリズムに任せよ、しかし結果に関しては保証しない",
            "世の中金金金ってどうかと思います",
            "負けちまえ",
            "知ったこっちゃない"
            ]

        let arasoi_list =
            [
            "無くならない",
            "いつだって貴方が悪い",
            "とにかく一歩引け",
            "この世から無くなると良いですね",
            "じゃんけんで決めよ、もしくは麻雀で決めよ",
            "すなわち弱肉強食"
            ]

        let renai_list =
            [
            "愛する者が去るでしょう、そして貴方は追うでしょう",
            "疲れるでしょう",
            "会えない時間をもっと伸ばす方がベター",
            "上手くいくと願っているが、まぁ人と人なんでねぇ〜",
            "占い師に頼ると失敗",
            "臆病者は上手くいかない"
            ]

        let yauturi_list =
            [
            "出ていけと言われる",
            "壁の傷を指摘されて敷金返ってこない",
            "引っ越した先の両隣がめちゃくちゃうるさい",
            "コンビニが近いと人間としてダメになる",
            "不動産会社に騙される",
            "夜逃げ同然"
            ]

        let osan_list =
            [
            "産湯を飲むな",
            "祝い金で破産",
            "貴方の子供ではない",
            "立ち合い時に気を失う",
            "歯を食いしばれ",
            "一気に7つ子産まれる"
            ]

        let yamai_list =
            [
            "は気から",
            "大事な時に掛かってしまう",
            "病院の体温計が壊れ、スルーされてしまう",
            "マスクは意味ない",
            "粥を3リットル分食べると治る、そしてニンニク25片入れて",
            "誤診断されてしまう"
            ]

        let endan_list =
            [
            "ブスが来ます",
            "当たりちゃ当たりだし、ハズレっちゃハズレ",
            "破談",
            "激アツが来るも断られる",
            "結婚詐欺師だった",
            "グッドラック！"
            ]
        
        //ランダムに表示される為の変数
        let omikuji_list_random = omikuji_list.randomElement()
        let negaigoto_random = negaigoto_list.randomElement()
        let machibito_random = machibito_list.randomElement()
        let usemono_random = usemono_list.randomElement()
        let tabidachi_random = tabidachi_list.randomElement()
        let akinai_random = akinai_list.randomElement()
        let gakumon_random = gakumon_list.randomElement()
        let souba_random = souba_list.randomElement()
        let arasoi_random = arasoi_list.randomElement()
        let renai_random = renai_list.randomElement()
        let yauturi_random = yauturi_list.randomElement()
        let osan_random = osan_list.randomElement()
        let yamai_random = yamai_list.randomElement()
        let endan_random = endan_list.randomElement()
        
        //ボタンを押した時にLabelへの紐付けにより、表示される
        unsei.text = "１：運勢：　" + omikuji_list_random!
        ganbou.text = "２：願望：　" + negaigoto_random!
        machibito.text = "３：待人：　" + machibito_random!
        usemono.text = "４：失物：　" + usemono_random!
        ryokou.text = "５：旅行：　" + tabidachi_random!
        akinai.text = "６：商売：　" + akinai_random!
        gakumon.text = "７：学問：　" + gakumon_random!
        souba.text = "８：相場：　" + souba_random!
        arasoigoto.text = "９：争事：　" + arasoi_random!
        renai.text = "１０：恋愛：　" + renai_random!
        tenkyo.text = "１１：転居：　" + yauturi_random!
        syussan.text = "１２：出産：　" + osan_random!
        byouki.text = "１３：病気：　" + yamai_random!
        endan.text = "１４：縁談：　" + endan_random!
        lastLabel.text = "※ジョークなので本気にしないでね"
        
        //サウンド
        audioPlayer.currentTime = 0         // 再生箇所を頭に移す
        audioPlayer.play()
    }
    
}
