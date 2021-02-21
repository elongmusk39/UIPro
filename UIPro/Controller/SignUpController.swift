//
//  SignUpController.swift
//  UIPro
//
//  Created by Long Nguyen on 8/15/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    private var viewModel = SignUpViewModel()
    private var profileImagePicked: UIImage?
    
//MARK: - Properties--------------------------------------------------
    
    private lazy var profileImage: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.tintColor = .black
        btn.clipsToBounds = true
        btn.imageView?.clipsToBounds = true
        btn.setDimensions(height: 150, width: 150)
        btn.layer.cornerRadius = 75
        btn.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        
        return btn
    }()
    
    
//--------------------------------------------------------------------
    
    private lazy var emailView: TextViewFrame = {
        let ev = TextViewFrame(icon: UIImage(systemName: "envelope"), textField: emailTextField)
        
        return ev
    }()
    
    private lazy var usernameView: TextViewFrame = {
        let uv = TextViewFrame(icon: UIImage(systemName: "person"), textField: usernameTextField)
        
        return uv
    }()
    
    private lazy var passwordView: TextViewFrame = {
        let pv = TextViewFrame(icon: UIImage(systemName: "lock"), textField: passwordTextField)
        
        return pv
    }()
    
    private lazy var emailTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Email")
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var usernameTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Username")
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

        
        return tf
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Password")
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

        return tf
    }()
    
//--------------------------------------------------------------------
    
    private lazy var signUpButton: UIButton = {
        let btn = UIButton()
        btn.setHeight(height: 50)
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return btn
    }()
    
    
    private lazy var alreadyHaveAnAccount: UIButton = {
        let btn = UIButton()
        btn.setTitle("Already have an account? - LOG IN", for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(switchToLogIn), for: .touchUpInside)
        
        return btn
    }()
    
    
    
//MARK: - Scenes--------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    
//MARK: - selectors--------------------------------------------------
    
    @objc func switchToLogIn () {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func handleSignUp () {
        print("signing up..")
    }
    
    @objc func handleSelectPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @objc func textDidChange (sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        else if sender == usernameTextField {
            viewModel.username = sender.text
        }
        else if sender == passwordTextField {
            viewModel.password = sender.text
        }
        
        checkFormStatus()
    }
    
    
    
//MARK: - Functions--------------------------------------------------
    
    func checkFormStatus () {
        if viewModel.formIsvalid == true {
            signUpButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            signUpButton.isEnabled = true
        } else  {
            signUpButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            signUpButton.isEnabled = false
        }
        
    }
    
    
    func configureUI() {
        configureGradient()
        
        view.addSubview(profileImage)
        profileImage.anchor(top: view.topAnchor, paddingTop: 50)
        profileImage.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailView,
                                                   usernameView,
                                                   passwordView,
                                                   signUpButton])
        stack.axis = .vertical
        stack.spacing = 10
        
        view.addSubview(stack)
        stack.anchor(top: profileImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 24, paddingRight: 24)
        
        
        view.addSubview(alreadyHaveAnAccount)
        alreadyHaveAnAccount.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 30, paddingBottom: 14, paddingRight: 30)
    }
    
    
    
    func configureGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.cyan.cgColor, UIColor.blue.cgColor]
        gradient.locations = [0, 1]
        
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
}




//MARK: - ProfileImage
//this extension is to set the properties of the profile image picked

extension SignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        
        profileImage.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        profileImage.layer.borderColor = UIColor.black.cgColor //alpha is how clear and strong the color is
        profileImage.layer.borderWidth = 2
        //profileImage.layer.cornerRadius = 80
        profileImage.imageView?.contentMode = .scaleAspectFill
        
        profileImagePicked = image
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

