import UIKit

public class PackageViewController: UIViewController {
    
    public weak var delegate: ResultDelegate?
       
        //MARK: - UI Elements
    
       private let nameField: UITextField = {
        let uf: UITextField = UITextField()
        uf.backgroundColor = .white
        uf.placeholder = "Enter your name"
        uf.translatesAutoresizingMaskIntoConstraints = false
        return uf
        }()

    private let submitButton: UIButton = {
        let button : UIButton = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
       
    //MARK: Lifecycle
    
       override public func viewDidLoad() {
            super.viewDidLoad()
            configureGUI()
       }
       
       func configureGUI() {
           view.backgroundColor = .red
        addNameField()
        addSubmitButton()
       }
       
    func addNameField() {
        view.addSubview(nameField)
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height/5),
            nameField.widthAnchor.constraint(equalToConstant: view.frame.width/1.5),
            nameField.heightAnchor.constraint(equalToConstant: view.frame.height/18),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func addSubmitButton() {
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
                      submitButton.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: view.frame.height/40),
                      submitButton.widthAnchor.constraint(equalToConstant: view.frame.width/1.5),
                      submitButton.heightAnchor.constraint(equalToConstant: view.frame.height/18),
                      submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                  ])
    }
       
    //MARK: Button Actions
    
       @objc func buttonAction(sender: UIButton) {
        if let name: String = nameField.text {
            delegate?.returnName(name)
            self.dismiss(animated: true, completion: nil)
               }
           }
       }
    
    //MARK: Protocols
    public protocol ResultDelegate: class {
       func returnName(_ name: String)
    }

