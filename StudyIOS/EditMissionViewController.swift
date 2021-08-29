//
//  EditMissionViewController.swift
//  StudyIOS
//
//  Created by 임윤휘 on 2021/08/29.
//

import UIKit

protocol EditMissionDelegate {
    //EditViewController에서 함수를 호출하며 메시지를 전달해 주는데, 이 메시지의 문자열 값을 '메인화면'의 텍스트 필드에 텍스트로 보여준다.
    //즉, '수정화면'에서 '메인화면'으로 데이터 전달
    func didMessageEditDone(_ controller: EditMissionViewController, message: String)
}

class EditMissionViewController: UIViewController {
    
    var textMessage: String = ""  //'메인화면'에서 Text Fielf의 text를 직접 제어할 수 없으므로 변수를 생성해 '메인화면'에서 해당 변수를 제어할 수 있도록 한다.
    var delegate:EditMissionDelegate?
    
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txMessage.text = textMessage//변수 message값은 txMessage의 text에 할당해 출력되도록 한다.
    }
    

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate!.didMessageEditDone(self, message: txMessage.text!)
        }
        
        _ = navigationController?.popViewController(animated: true)
        //내비게이션 스택에서 top 뷰 컨트롤러를 삭제 후 반환한다(pop). 그리고 화면을 갱신한다.
        //와일드 카드 식별자는 반환값은 있지만 사용하지 않을 때 사용한다
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
