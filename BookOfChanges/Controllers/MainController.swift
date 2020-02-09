//
//  ViewController.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 09.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    var backView: UIImageView = {
        let back = UIImageView()
        back.image = UIImage(named: "BackgroundMain")
        back.contentMode = .scaleAspectFill
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    var topView: UIImageView = {
        let top = UIImageView()
        top.image = UIImage(named: "Block")
        top.translatesAutoresizingMaskIntoConstraints = false
        return top
    }()
    
    var mainScroll: UITextView = {
        let scroll = UITextView()
        scroll.text = "Relationships with those in authority and seniors would be highly amicable, so you can make the best use of this aspect to present your ideas and to discuss important matters. Perhaps, the transiting planets may make you very anxious to take the relationship to the next level."
        scroll.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        scroll.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 18)
        scroll.textAlignment = .left
        scroll.backgroundColor = .clear
        scroll.indicatorStyle = .black
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.isEditable = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var monthLabel: UILabel = {
        let month = UILabel()
        let date = Date()
        let monthString = date.month
        month.text = monthString // Get current month FIX IF needed
        month.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        month.textAlignment = .center
        month.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        month.translatesAutoresizingMaskIntoConstraints = false
        return month
    }()
    
//    let proButton: UIButton = {
//        let button = UIButton()
//        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 22)
//        button.setTitle("PRO", for: .normal)
//        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
//        button.titleLabel?.layer.shadowRadius = 1.0
//        button.titleLabel?.layer.shadowOpacity = 1.0
//        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        button.setBackgroundImage(UIImage(named: "BlockProMain"), for: .normal)
//        button.contentMode = .scaleAspectFill
//        button.addTarget(self, action: #selector(topProButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }()
    
    let imageBottomView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BottomButton")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottonButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let findBottonButton: UILabel = {
        let label = UILabel()
        label.text = "Find out your fate"
        label.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        label.textAlignment = .left
        label.minimumScaleFactor = 0.75
        label.adjustsFontSizeToFitWidth = true
        label.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        label.layer.shadowRadius = 1.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        label.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let labelBottonButton: UILabel = {
        let label = UILabel()
        label.text = "throw coins"
        label.textColor = #colorLiteral(red: 0.9058823529, green: 0.8235294118, blue: 0.7607843137, alpha: 1)
        label.textAlignment = .left
        label.minimumScaleFactor = 0.75
        label.adjustsFontSizeToFitWidth = true
        label.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        label.layer.shadowRadius = 1.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        label.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonLabelImage: UIImageView = {
        let buttonImage = UIImageView()
        buttonImage.image = UIImage(named: "bottomWhiteButton")
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        return buttonImage
    }()
    
    let bottomLabelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.alignment = UIStackView.Alignment.fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let bottomAllStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let coinImage: UIImageView = {
        let coin = UIImageView()
        coin.image = UIImage(named: "coinLabel")
        coin.contentMode = .scaleAspectFill
        coin.translatesAutoresizingMaskIntoConstraints = false
        return coin
    }()
    
    let nameLabel: UITextField = {
        let name = UITextField()
        name.text = "Name"
        name.autocapitalizationType = .words
        name.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        name.textAlignment = .center
        name.minimumFontSize = 18.0
        name.adjustsFontSizeToFitWidth = true
        name.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        name.layer.shadowRadius = 1.0
        name.layer.shadowOpacity = 1.0
        name.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        name.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 40)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    
    let hierogliph: UILabel = {
        let hierogliph = UILabel()
        hierogliph.text = "䷄"
        hierogliph.textColor = #colorLiteral(red: 0.2129859924, green: 0.161139518, blue: 0.1228835955, alpha: 1)
        hierogliph.minimumScaleFactor = 0.3
        hierogliph.adjustsFontSizeToFitWidth = true
        hierogliph.textAlignment = .center
        
        switch UIScreen.main.bounds.height {
        case 0 ..< 600:
             hierogliph.font = UIFont(name: "DejaVuSans", size: 55)
        case 600 ... 800:
             hierogliph.font = UIFont(name: "DejaVuSans", size: 70)
        default:
             hierogliph.font = UIFont(name: "DejaVuSans", size: 90)
        }
        hierogliph.translatesAutoresizingMaskIntoConstraints = false
        return hierogliph
    }()
    
    let symbolChinaLabel: UILabel = {
        let china = UILabel()
        china.text = "需 (xū)"
        china.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        china.textAlignment = .center
        china.minimumScaleFactor = 0.2
        china.adjustsFontSizeToFitWidth = true
        china.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        china.layer.shadowRadius = 1.0
        china.layer.shadowOpacity = 1.0
        china.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        china.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        china.translatesAutoresizingMaskIntoConstraints = false
        return china
    }()
    
    let symbolEnglishLabel: UILabel = {
        let english = UILabel()
        english.text = "”Attending”"
        english.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        english.textAlignment = .center
        english.minimumScaleFactor = 0.3
        english.adjustsFontSizeToFitWidth = true
        english.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        english.layer.shadowRadius = 1.0
        english.layer.shadowOpacity = 1.0
        english.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        english.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        english.translatesAutoresizingMaskIntoConstraints = false
        return english
    }()
    
    let activityView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .gray
        activity.hidesWhenStopped = true
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.startAnimating()
        hideKeyboardWhenTappedAround()
        nameLabel.delegate = self
        nameLabel.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        
        addInSubwiew()
        
        backConstraints()
        topViewConstrain()
        scrollViewConstrain()
        monthLabelConstrain()
//        proButtonConstraint()
        bottomButtonConstraints()
        coinImageConstraints()
        nameFieldConstraints()
        hierogliphConstraints()
        symbolChinaConstraint()
        symbolEnglishConstraint()
        bottomAllStackConstraints()
        imageBottomViewConstraints()
        activityViewConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDatafromUserDefault()
    }
    
    
    func addInSubwiew() {
        
        view.addSubview(backView)
        view.addSubview(topView)
        view.addSubview(mainScroll)
        mainScroll.addSubview(activityView)
        view.addSubview(monthLabel)
//        view.addSubview(proButton)
        
        view.addSubview(coinImage)
        view.addSubview(nameLabel)
        view.addSubview(hierogliph)
        view.addSubview(symbolChinaLabel)
        view.addSubview(symbolEnglishLabel)
        
        view.addSubview(imageBottomView)
        
        bottomLabelStack.addArrangedSubview(findBottonButton)
        bottomLabelStack.addArrangedSubview(labelBottonButton)
        bottomAllStack.addArrangedSubview(bottomLabelStack)
        bottomAllStack.addArrangedSubview(buttonLabelImage)
        view.addSubview(bottomAllStack)
        view.addSubview(bottonButton)
    }
    
    func backConstraints() {
        
        backView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func topViewConstrain() {
        topView.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/2).isActive = true
        topView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
    }
    
    func scrollViewConstrain() {
        mainScroll.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8).isActive = true
        mainScroll.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8).isActive = true
        mainScroll.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8).isActive = true
        mainScroll.bottomAnchor.constraint(equalTo: bottonButton.topAnchor).isActive = true
    }
    
    func activityViewConstraints() {

        activityView.centerYAnchor.constraint(equalTo: mainScroll.centerYAnchor, constant: -25).isActive = true
        activityView.centerXAnchor.constraint(equalTo: mainScroll.centerXAnchor).isActive = true
    }
    
    func monthLabelConstrain() {
        monthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        monthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        monthLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 35).isActive = true
        monthLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 91).isActive = true
    }
    
//    func proButtonConstraint() {
//        proButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15).isActive = true
//        proButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
//        proButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.29).isActive = true
//        proButton.heightAnchor.constraint(equalTo: proButton.widthAnchor, multiplier: 0.55).isActive = true
//    }
    
    func imageBottomViewConstraints() {
        
        let heightContant = UIScreen.main.bounds.width / 3.75
        imageBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageBottomView.heightAnchor.constraint(equalToConstant: heightContant).isActive = true
    }
    
    func bottomButtonConstraints() {
        bottonButton.centerXAnchor.constraint(equalTo: imageBottomView.centerXAnchor).isActive = true
        bottonButton.centerYAnchor.constraint(equalTo: imageBottomView.centerYAnchor).isActive = true
        bottonButton.heightAnchor.constraint(equalTo: imageBottomView.heightAnchor).isActive = true
        bottonButton.widthAnchor.constraint(equalTo: imageBottomView.widthAnchor).isActive = true
    }
    
    func bottomAllStackConstraints() {
        bottomAllStack.centerXAnchor.constraint(equalTo: bottonButton.centerXAnchor).isActive = true
        bottomAllStack.centerYAnchor.constraint(equalTo: bottonButton.centerYAnchor).isActive = true
    }
    
    func coinImageConstraints() {
        coinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coinImage.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 16).isActive = true
        coinImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        coinImage.widthAnchor.constraint(equalTo: coinImage.heightAnchor, multiplier: 1).isActive = true
    }
    
    func nameFieldConstraints() {

        nameLabel.bottomAnchor.constraint(equalTo: hierogliph.topAnchor, constant: 0).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: coinImage.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: coinImage.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    func hierogliphConstraints() {
        hierogliph.centerXAnchor.constraint(equalTo: coinImage.centerXAnchor).isActive = true
        hierogliph.centerYAnchor.constraint(equalTo: coinImage.centerYAnchor, constant: -4).isActive = true
        hierogliph.heightAnchor.constraint(equalTo: coinImage.heightAnchor, multiplier: 0.28).isActive = true
        hierogliph.widthAnchor.constraint(equalTo: coinImage.widthAnchor, multiplier: 0.30).isActive = true
        
    }
    
    func symbolChinaConstraint() {
        if UIScreen.main.bounds.height < 700 {
        symbolChinaLabel.topAnchor.constraint(equalTo: hierogliph.bottomAnchor, constant: 10).isActive = true
        } else {
        symbolChinaLabel.topAnchor.constraint(equalTo: hierogliph.bottomAnchor, constant: 20).isActive = true
        }
        symbolChinaLabel.centerXAnchor.constraint(equalTo: coinImage.centerXAnchor).isActive = true
        symbolChinaLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        symbolChinaLabel.widthAnchor.constraint(equalTo: hierogliph.widthAnchor).isActive = true
    }
    
    func symbolEnglishConstraint() {
        symbolEnglishLabel.centerXAnchor.constraint(equalTo: coinImage.centerXAnchor).isActive = true
        symbolEnglishLabel.topAnchor.constraint(equalTo: symbolChinaLabel.bottomAnchor, constant: 0).isActive = true
        symbolEnglishLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        symbolEnglishLabel.widthAnchor.constraint(equalTo: coinImage.widthAnchor, multiplier: 0.55).isActive = true
    }
    
    func addDatafromUserDefault() {
        let defaults = UserDefaults.standard
        guard let hierogliphText = defaults.string(forKey: "hierogliph") else { return }
        hierogliph.text = hierogliphText
        guard let china = defaults.string(forKey: "chinaText") else { return }
        symbolChinaLabel.text = china
        guard let english = defaults.string(forKey: "englishText") else { return }
        symbolEnglishLabel.text = english
        if let scroll = defaults.string(forKey: "fullScroll") {
            mainScroll.text = scroll
            self.activityView.stopAnimating()
        } else {
            getResponceFromJson()
        }
        guard let name = defaults.string(forKey: "name") else { return }
        nameLabel.text = name
    }
    
    
//    @objc func topProButtonTapped() {
//
//        let vc = ProViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//
//    }
    
    @objc private func bottomButtonTapped() {
        let vc = CheckFateController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    func getResponceFromJson() {
        
        let monthNetworkService = NetworkMonthDataFetcher()
        
        let urlString = "https://app.thebookofchanges.net/api/month-prediction"        
        monthNetworkService.fetchData(urlString: urlString) { ( result ) in
            guard let result = result else { return }
            if result.text != nil {
                self.mainScroll.text = result.text
                self.activityView.stopAnimating()
            }
        }
    }
    
    
}





