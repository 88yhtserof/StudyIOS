/*
 문제: 웹 앱 만들기
 HTML 파일을 읽어 디스플레이라고 링크를 걸어 블로그로 이동하게 만들어 보라
 
 구현 순서
 1. 레이아웃 배치 - 웹 뷰, 툴바, 툴바 버튼, 텍스트 필드, url 입력 버튼, 액티비티 인디케이터
 2. 아울렛 변수 및 액션 함수 생성
 3. 앱 시작 화면 초기화 - HTML 파일로 웹 페이지 생성
 4. 툴바 버튼 기능 구현
 5. url 입력 기능 구현
 */
import UIKit
import WebKit

class WebMissionViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField! //텍스트 필드에 적힌 text 속정을 제어해야 하므로 아울렛 변수 추가
    @IBOutlet var myWebView: WKWebView! //웹 뷰의 내용, 즉 속성을 제어해야하므로 아울렛 변수 추가
    @IBOutlet var MyActivityIndicator: UIActivityIndicatorView!//인티케이터 hide 속성을 제어해야 하므로 아울렛 변수 추가
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.navigationDelegate = self //self는 해당 뷰를 의미한다.
        
        //초기 화면 설정
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let fileUrl = URL(fileURLWithPath: filePath!)
        let fileRequest = URLRequest(url: fileUrl)
        myWebView.load(fileRequest)
    }
    
    //didCommit을 인수로 갖는 메서드
    //로딩 중인지 확인하는 델리게이트 메서드
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        MyActivityIndicator.startAnimating()
        MyActivityIndicator.isHidden = false
    }
    
    //didFinish를 인수로 갖는 메서드
    //로딩이 끝났음을 알리는 델리게이트 메서드
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        MyActivityIndicator.stopAnimating()
        MyActivityIndicator.isHidden = true
    }
    
    //didFail과 withError을 인수로 갖는 델리게이트 메서드
    //로딩 중 오류가 발생했음을 알리는 델리게이트 메서드
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        MyActivityIndicator.stopAnimating()
        MyActivityIndicator.isHidden = true
    }
    
    //웹 뷰에 웹 페이지를 로드하기 위한 함수
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    //주소의 프로토콜 여부를 확인하는 함수
    func checkUrl(_ url: String) -> String {
        var strUrl:String = url
        let flag = strUrl.hasPrefix("https://")
        
        if !flag {
            strUrl = "https://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        
        loadWebPage(myUrl)
    }
    
    @IBAction func btnBarStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnBarReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnBarGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnBarGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}
