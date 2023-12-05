//
//  ViewController.swift
//  Weather App
//
//  Created by Guilherme Fonseca on 30/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var statsStackViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = .black
//        stackView.backgroundColor = UIColor(named:"softGray")
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 23, trailing: 24)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var humidityInfo: StatsLabel = {
        let variable = StatsLabel(text: "Umidade", value: "1000mm")
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.backgroundColor = .red
        return variable
    }()
    
    private lazy var windInfo: StatsLabel = {
        let variable = StatsLabel(text: "Vento", value: "1090mm")
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.backgroundColor = .green
        return variable
        
    }()
    
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
    
    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "São Paulo"
        label.textAlignment = .center
        label.textColor = UIColor(named: "primaryColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = UIColor(named: "primaryColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "sunAsset")
        image.contentMode = .scaleAspectFit //respeita tamanho e proporção
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        statsStackViews.addArrangedSubview(humidityInfo)
        statsStackViews.addArrangedSubview(windInfo)
        
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackViews)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            
            headerView.heightAnchor.constraint(equalToConstant: 169),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            
        ])
        
        NSLayoutConstraint.activate([
            
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            
            humidityInfo.topAnchor.constraint(equalTo: statsStackViews.topAnchor),
            humidityInfo.heightAnchor.constraint(equalToConstant: 100),
            
            windInfo.topAnchor.constraint(equalTo: humidityInfo.bottomAnchor, constant: 40),
            windInfo.heightAnchor.constraint(equalToConstant: 100),
            
            statsStackViews.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            statsStackViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            statsStackViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            statsStackViews.heightAnchor.constraint(equalToConstant: 500)
            
        ])
    }
    
}
