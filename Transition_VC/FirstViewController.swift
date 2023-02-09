//
//  FirstViewController.swift
//  Transition_VC
//
//  Created by BS K on 2023/02/09.
//

// MARK: - 코드로 만들건데 UI도 코드로 짤것이다.

import UIKit

class FirstViewController: UIViewController {

    //0단계 원하는 것들 만들기.
    let mainLabel = UILabel()
    
    //클로저의 실행문으로 버튼 레이아웃 짜기.
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        
        // MARK: - 버튼 레이아웃 설정하기.
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        
    }
    
    
    
    
    func makeUI() {
        
        mainLabel.text = someString
        view.backgroundColor = UIColor.lightGray
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        //1단계 화면에 올려야지
        view.addSubview(mainLabel)
        
        //2단계 오토레이웃 설정
      
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
       
        
        // MARK: - 버튼 오토레이아웃 설정
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
    }
    
    @objc func backButtonTapped() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

}
