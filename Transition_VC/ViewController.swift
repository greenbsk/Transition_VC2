

import UIKit

class ViewController: UIViewController {
    
    // UIVC에는 stroyboard가 이미 선언되어있다. 가져다 쓰자.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        //메모리에만 올렸다. let으로 선언해서!
        let firstVC = FirstViewController()
        
        firstVC.someString = "안녕하냐?"
        
        //화면에 가득차게 만들기.
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
        
        
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동 //추천 방식//
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        
        secondVC.someString = "안녕하겠냐?"
        
        
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
       
        if num > 5 {
            
        } else {
            performSegue(withIdentifier: "toThirdVC", sender: self) //sender는 보내는 녀석 self => 현재 뷰컨트롤러.
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segue는 파라미터이다. 어디로 보내줄것인지.
        
        if segue.identifier == "toThirdVC" {
            
            let thirdVC = segue.destination as! ThirdViewController
            
            thirdVC.someString = "스토리보드로 간접세그웨이로 데이터 넘기기"
            
        }
        
        if segue.identifier == "toFourthVC" {
            
            let fourthVC = segue.destination as! FourthViewController
            
            fourthVC.someString = "스토리보드로 직접세그웨이로 데이터 넘기기"
            
        }
        
        
        
    }
    
    
    var num : Int = 7
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if num > 5 {
            return true
        } else if num < 4 {
            return false
        } else {
            return false
        }
    }
    
    
    
    
}
