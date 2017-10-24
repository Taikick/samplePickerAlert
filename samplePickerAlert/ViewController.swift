//
//  ViewController.swift
//  samplePickerAlert
//
//  Created by 加藤　大起 on 2017/10/24.
//  Copyright © 2017年 Taiki Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var myPickerView: UIPickerView!
    
    var teaList: [String] = ["ダージリン","アールグレイ","アッサム","オレンジペコ","午後の紅茶"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teaList.append("緑茶")
        // 6.指示を出しているのがViewControllerだと伝える設定
        //self : 自分自身(ViewControllerのこと)
        //データソース（表示するデータの設定を指示する人）
        myPickerView.dataSource = self
        
        //デリゲート（完治したイベントを委任する人、代理人（店長））
        myPickerView.delegate = self

    }
    
    
    //3.ピッカービューの列数を決定する
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        
        return 1;
    }
    
    //4.ピッカービューの行数を決定する
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teaList.count;
    }
    
    //5.ピッカービューに表示する文字の設定
    //row : 上で設定したrowの数だけ実行
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //今ピッカービューが何行目のデータを作ろうとしているか
        return teaList[row];
    }
    
    //(6.)選択された項目をデバックエリアに出力
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //選択された項目が何行目か
        print(teaList[row])
        
        
        //部品となるアラートを作成
        let alert = UIAlertController(title: "紅茶選択", message: "\(teaList[row])飲みたい？", preferredStyle: .alert)
        
        //アラートにOKボタンを追加
        //handler : OKボタンが押された時に行いたい処理を指定する場所
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OK押されました")}))
        
        //アラートを表示する処理
        //completion : 動作が完了した後に発動するメソッド
        //animated :
        present(alert, animated: true, completion: {() -> Void in print("アラートが表示されました") })
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

