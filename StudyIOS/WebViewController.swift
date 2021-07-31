/*
 웹 뷰란?
 웹 콘텐츠를 뷰 형태로 보여 주는 앱. HTML로 작성된 홈페이지를 표시할 수 있다.
 직접 인터넷에 연결된 주소를 입력하여 홈페이지에 접속할 수 있을 뿐만 아니라 미리 저장된 HTML 파일을 읽어들여 표시 가능
 */

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    //웹 페이지를 로드하는 함수
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url) //utl 값을 받아 URL형으로 선언
        let myRequest = URLRequest(url: myUrl!) //URLRequest형으로 선언
        myWebView.load(myRequest)
    }
    
    //뷰 생성 시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //앱 시작 시 지정한 웹 페이지가 나타나도록 설정
        loadWebPage("https://88yhtserof.tistory.com")
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
    }
 
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
    }
}
