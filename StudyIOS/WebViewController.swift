/*
 웹 뷰란?
 웹 콘텐츠를 뷰 형태로 보여 주는 앱. HTML로 작성된 홈페이지를 표시할 수 있다.
 직접 인터넷에 연결된 주소를 입력하여 홈페이지에 접속할 수 있을 뿐만 아니라 미리 저장된 HTML 파일을 읽어들여 표시 가능
 */

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
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
        
        //웹 뷰가 로딩 중인지 살펴보기 위해 델리게이트 선언
        myWebView.navigationDelegate = self
        
        //앱 시작 시 지정한 웹 페이지가 나타나도록 설정
        loadWebPage("https://88yhtserof.tistory.com")
    }
    
    //로딩 중인지 확인하기 위한 델리게이트 메서드
    //myWebView가 로딩 중일 때 인디케이터를 실행하고 화면에 나타나게 한다.
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    //로딩이 완료되었을 때 동작하는 델리게이트 메서드
    //인디케이터를 중지하고 숨긴다.
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    //로딩 실패 시 동작
    //인디케이터를 중지하고 숨긴다.
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://github.com/88yhtserof")
    }
 
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.naver.com")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1>안녕하세요?</h1><p>HTML 테스트 중</p><p>나의 블로그 <a href=\"https://88yhtserof.tistory.com\">88yhtserof</a>로 이동</p>"
        //줄을 바뀌 입력하면 에러가 발생한다. 줄 바꿈 없이 사용해야 한다.
        
        myWebView.loadHTMLString(htmlString, baseURL:nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() //웹 페이지 로딩 중지
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() //웹 페이지 재로딩
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() //이전 웹 페이지로 이동
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward() //다음 웹 페이지로 이동
    }
}
