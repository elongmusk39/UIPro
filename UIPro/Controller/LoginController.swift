//
//  LoginController.swift
//  UIPro
//
//  Created by Long Nguyen on 8/14/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit



class LoginController: UIViewController {
    
//MARK: - Properties
    
    private var viewModel = LogInViewModel()
    private var emailText: String?
    private var passwordText: String?
    
    
    private lazy var themeImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "car")
        iv.tintColor = .black
        
        return iv
    }()
    
    
    private lazy var emailView: TextViewFrame = {
        let ev = TextViewFrame(icon: UIImage(systemName: "envelope"), textField: emailTextField)
        //ev.backgroundColor = .yellow
        
        return ev
    }()
    
    private lazy var passwordView: TextViewFrame = {
        let pv = TextViewFrame(icon: UIImage(systemName: "lock"), textField: passwordTextField)
        //pv.backgroundColor = .green
        
        return pv
    }()
    
    
    private lazy var emailTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Email")
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Password")
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var logInButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.isEnabled = true
        btn.setTitleColor(.black, for: .normal)
        btn.setHeight(height: 50)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var chatButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go to chat", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.setHeight(height: 50)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(switchToChat), for: .touchUpInside)
        
        return btn
    }()
    
    
    private lazy var dontHaveAnAccountButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Don't have an account? - SIGN UP", for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        //btn.setHeight(height: 40)
        btn.addTarget(self, action: #selector(switchToSignUp), for: .touchUpInside)
        
        return btn
    }()
    
    
//MARK: - Scenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    
//MARK: - Selectors
    
    @objc func handleLogin () {
        print("logging in..")
        
        let alert = UIAlertController(title: "No login enabled", message: "Try on different version", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func switchToChat () {
        //DispatchQueue.main.async {}  //if the data dont fetch or error happens, then throw everything inside this DispatchQueue block
        
        let chatVC = ChatController()
        let nav = UINavigationController(rootViewController: chatVC)
        nav.modalPresentationStyle = .fullScreen
        //nav.modalTransitionStyle = .crossDissolve
        present(nav, animated: true, completion: nil)
    }
    
    
    @objc func switchToSignUp () {
        let VC = SignUpController()
        VC.modalPresentationStyle = .fullScreen
        VC.modalTransitionStyle = .flipHorizontal
        present(VC, animated: true, completion: nil)
    }
    
    
    @objc func textDidChange (sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        else if sender == passwordTextField {
            viewModel.password = sender.text
        }
        
        checkformStatus()
        
    }
    
    
    
//MARK: - Functions
    
    
    func checkformStatus () {
        if viewModel.formIsValid == true {
            logInButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            logInButton.isEnabled = true
        } else {
            logInButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            logInButton.isEnabled = false
        }
        
    }
    
    
    
    func configureUI () {
        //view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        configureGradient()
        
        view.addSubview(themeImage)
        themeImage.anchor(top: view.topAnchor, paddingTop: 60)
        themeImage.centerX(inView: view)
        themeImage.setDimensions(height: 120, width: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailView,
                                                  passwordView,
                                                  logInButton,
                                                  chatButton])
        stack.axis = .vertical
        stack.spacing = 10
        
        view.addSubview(stack)
        stack.anchor(top: themeImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 36, paddingLeft: 24, paddingRight: 24)
        
        view.addSubview(dontHaveAnAccountButton)
        dontHaveAnAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 30, paddingBottom: 14, paddingRight: 30)
        
    }
    
    
    func configureGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.cyan.cgColor, UIColor.purple.cgColor]
        gradient.locations = [0, 1]
        
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
    
    
}
