//
//  ViewController.swift
//  StudyIOS
//
//  Created by 임주은 on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var IdHello: UILabel! //출력 레이블용 아울렛 변수
    @IBOutlet var txtName: UITextField!  //이름 입력용 아울렛 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        //"Hello, "라는 문자열과 txtName.text의 문자열을 결합하여 IdHello.txt에 넣음
        //문자열을 합칠 때는 + 연산자를 사용한다.
        IdHello.text="Hello, "+txtName.text!
    }
}

