//
//  EditViewController.swift
//  StudyIOS
//
//  Created by 임윤휘 on 2021/08/28.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    //레이블의 텍스트를 직접 제어할 수 없기 때문에 문자열 변수 생성
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn: Bool = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //뷰가 로드될 떄 실행되는 함수이므로, textWayValue에는 이저 화면에서 할당한 값이 들어있다.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    

    //완료 버튼을 누를 시 '메인 화면'으로 돌아가게 만든다.
    @IBAction func btnDone(_ sender: UIButton) {
        //메인화면으로 텍스트와 전구 이미지 상태 보내기
        //'수정 화면'의 btn 함수에서 didMessageEditDone을 호출하면서 '수정화면'의 텍스트 필드 내용을 문자열로 전달한다. 즉, '수정화면'의 데이터를 '메인화면'으로 전달한다.
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        //메인 화면으로 이동하기
        _ = navigationController?.popViewController(animated: true)
    }
    
    //전구 켜고 끄기
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn { //켜져있으면
            isOn = true
        }else { //꺼져있으면
            isOn = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
