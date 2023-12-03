//
//  ViewController.swift
//  Weather App
//
//  Created by Guilherme Fonseca on 30/11/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var backgroundView: UIImageView = {
        
        /*
         criando a minha subview que somente é executada uma vez
         quando a propriedade é acessada pela primeira vez.
         Ela só é alocada na memória quando utilizada.
         */
        
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func setupView() {
        view.backgroundColor = .red

        setHierarchy() // se eu não setar a hierarquia, o app não compila
        setConstraints()
    }
    
    private func setHierarchy() {
        // adicionando a minha subview sob a minha view vermelha
        view.addSubview(backgroundView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
