//
//  MeaningController.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 17.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

private enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

import UIKit

class MeaningController: UIViewController {
    
    private var currentState: State = .open
    private var bottomConstraint = NSLayoutConstraint()
    private var heightConstant: CGFloat = 0
    var dataResult: DataModel?
    
    let backGroundImage: UIImageView = {
        let back = UIImageView()
        back.image = UIImage(named: "BackgroundMain")
        back.contentMode = .scaleAspectFill
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    let answerImageTop: UIImageView = {
        let proImage = UIImageView()
        proImage.image = UIImage(named: "Texture")
        proImage.contentMode = .scaleAspectFill
        proImage.translatesAutoresizingMaskIntoConstraints = false
        return proImage
    }()
    
    let answerTextLabel: UILabel = {
        let topText = UILabel()
        topText.text = "Your answer is:"
        topText.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        topText.textAlignment = .center
        topText.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        topText.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        topText.layer.shadowRadius = 1.0
        topText.layer.shadowOpacity = 1.0
        topText.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        topText.translatesAutoresizingMaskIntoConstraints = false
        return topText
    }()
    
    
    let hierogliphText: UILabel = {
        let hierogliph = UILabel()
        hierogliph.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        hierogliph.textAlignment = .center
        hierogliph.minimumScaleFactor = 0.5
        hierogliph.adjustsFontSizeToFitWidth = true
        hierogliph.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        hierogliph.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        hierogliph.layer.shadowRadius = 1.0
        hierogliph.layer.shadowOpacity = 1.0
        if UIScreen.main.bounds.height < 600 {
                  hierogliph.font = UIFont(name: "Symbola", size: 50)
              } else {
                  hierogliph.font = UIFont(name: "Symbola", size: 60)
        }
        hierogliph.translatesAutoresizingMaskIntoConstraints = false
        return hierogliph
    }()
    
    let chinaTextLabel: UILabel = {
        let chinaText = UILabel()
        chinaText.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        chinaText.minimumScaleFactor = 0.5
        chinaText.adjustsFontSizeToFitWidth = true
        chinaText.textAlignment = .center
        chinaText.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        chinaText.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        chinaText.layer.shadowRadius = 1.0
        chinaText.layer.shadowOpacity = 1.0
        chinaText.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        chinaText.translatesAutoresizingMaskIntoConstraints = false
        return chinaText
    }()
    
    let englishTextLabel: UILabel = {
        let english = UILabel()
        english.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        english.textAlignment = .center
        english.minimumScaleFactor = 0.35
        english.adjustsFontSizeToFitWidth = true
        english.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        english.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        english.layer.shadowRadius = 1.0
        english.layer.shadowOpacity = 1.0
        english.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        english.translatesAutoresizingMaskIntoConstraints = false
        return english
    }()
    
    let stackTextView: UIStackView = {
        let stackText = UIStackView()
        stackText.axis = NSLayoutConstraint.Axis.vertical
        stackText.alignment = UIStackView.Alignment.fill
        stackText.spacing = 0
        stackText.translatesAutoresizingMaskIntoConstraints = false
        return stackText
    }()
    
    let stackAllView: UIStackView = {
        let stackAll = UIStackView()
        stackAll.axis = NSLayoutConstraint.Axis.horizontal
        stackAll.alignment = UIStackView.Alignment.center
        stackAll.spacing = 10
        stackAll.translatesAutoresizingMaskIntoConstraints = false
        return stackAll
    }()
    
    let fullImageSwipe: UIImageView = {
        let full = UIImageView()
        full.image = UIImage(named: "SwipeTexture")
        full.contentMode = .scaleAspectFill
        full.translatesAutoresizingMaskIntoConstraints = false
        return full
    }()
    
    
    let fullScroll: UILabel = {
        let scroll = UILabel()
        scroll.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        scroll.numberOfLines = 0
        scroll.minimumScaleFactor = 0.5
        scroll.adjustsFontSizeToFitWidth = true
        scroll.font = UIFont(name: "IM_FELL_Double_Pica_Roman", size: 22)
        scroll.textAlignment = .left
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let fullMeaningLabel: UILabel = {
        let full = UILabel()
        full.text = "Full meaning"
        full.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        full.textAlignment = .center
        full.minimumScaleFactor = 0.5
        full.adjustsFontSizeToFitWidth = true
        full.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        full.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        full.layer.shadowRadius = 1.0
        full.layer.shadowOpacity = 1.0
        full.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 30)
        full.translatesAutoresizingMaskIntoConstraints = false
        return full
    }()
    
    let fullMeaningButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.setBackgroundImage(UIImage(named: "CloseTopButton"), for: .normal)
        button.addTarget(self, action: #selector(popupViewTapped(recognizer:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fullStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.fill
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    let monthFateLabel: UILabel = {
        let month = UILabel()
        month.text = "Our month fate advice"
        month.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 34)
        month.textAlignment = .center
        month.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        month.adjustsFontSizeToFitWidth = true
        month.minimumScaleFactor = 0.5
        month.translatesAutoresizingMaskIntoConstraints = false
        return month
    }()
    
    let mainScroll: UITextView = {
        let scroll = UITextView()
        scroll.text = "Relationships with those in authority and seniors would be highly amicable, so you can make the best use of this aspect to present your ideas and to discuss important matters. Perhaps, the transiting planets may make you very anxious to take the relationship to the next level."
        scroll.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        scroll.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 20)
        scroll.textAlignment = .left
        scroll.backgroundColor = .clear
        scroll.indicatorStyle = .black
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.adjustsFontForContentSizeCategory = true
        scroll.isEditable = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    
    let backButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        button.titleLabel?.layer.shadowRadius = 1.0
        button.titleLabel?.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.setBackgroundImage(UIImage(named: "autoBlock"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDataFromModel()
        getResponceFromJson()
        addInSubview()
        backGroundImageConstraints()
        monthFateLabelConstraints()
        mainScrollConstraints()
        fullStackConstraints()
        fullMeaningLabelConstraints()
        fullMeaningButtonConstraints()
        fullImageSwipeConstrains()
        fullScrollConstraints()
        answerImageTopConstraints()
        answerTextLabelConstraints()
        hieroglyphImageConstraints()
        chinaTextLabelConstrains()
        englishTextLabelConstrains()
        stackAllViewConstraints()
        backButtonConstraint()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(hierogliphText.text, forKey: "hierogliph")
        UserDefaults.standard.set(chinaTextLabel.text, forKey: "chinaText")
        UserDefaults.standard.set(englishTextLabel.text, forKey: "englishText")
        UserDefaults.standard.set(fullScroll.text, forKey: "fullScroll")
    }
    
    func addInSubview() {
        view.addSubview(backGroundImage)
        view.addSubview(backButton)
        view.addSubview(monthFateLabel)
        view.addSubview(mainScroll)
        view.addSubview(fullImageSwipe)
        view.addSubview(fullScroll)
        
        fullStack.addArrangedSubview(fullMeaningLabel)
        fullStack.addArrangedSubview(fullMeaningButton)
        view.addSubview(fullStack)
        
        view.addSubview(answerImageTop)
        view.addSubview(answerTextLabel)
        view.addSubview(hierogliphText)
        
        stackTextView.addArrangedSubview(chinaTextLabel)
        stackTextView.addArrangedSubview(englishTextLabel)
        
        stackAllView.addArrangedSubview(hierogliphText)
        stackAllView.addArrangedSubview(stackTextView)
        
        view.addSubview(stackAllView)
    }
    
    func backGroundImageConstraints() {
        backGroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func monthFateLabelConstraints() {
        let heightConstant: CGFloat
        if UIScreen.main.bounds.height < 600 {
            heightConstant = 80
        } else {
            heightConstant = 90
        }
        monthFateLabel.topAnchor.constraint(equalTo: answerImageTop.bottomAnchor, constant: heightConstant).isActive = true
        monthFateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        monthFateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    func mainScrollConstraints() {
        
        mainScroll.topAnchor.constraint(equalTo: monthFateLabel.bottomAnchor, constant: 10).isActive = true
        mainScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        mainScroll.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -4).isActive = true
        mainScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    }
    
    func fullImageSwipeConstrains() {
        
        heightConstant = self.view.frame.height
                
        fullImageSwipe.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        fullImageSwipe.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        fullImageSwipe.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true

        bottomConstraint = fullImageSwipe.bottomAnchor.constraint(equalTo: view.topAnchor, constant: heightConstant)
        bottomConstraint.isActive = true
    }
    
    func fullScrollConstraints() {
        
        let heightConstant = UIScreen.main.bounds.height / 3.55
        
        fullScroll.bottomAnchor.constraint(lessThanOrEqualTo: fullStack.topAnchor, constant: -30).isActive = true
        fullScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        fullScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        fullScroll.topAnchor.constraint(equalTo: fullImageSwipe.topAnchor, constant: heightConstant).isActive = true
    }
    
    func fullStackConstraints() {
        
        fullStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fullStack.bottomAnchor.constraint(equalTo: fullImageSwipe.bottomAnchor, constant: -20).isActive = true
    }
    
    func fullMeaningLabelConstraints() {
        fullMeaningLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
    }
    
    func fullMeaningButtonConstraints() {
        fullMeaningButton.widthAnchor.constraint(equalToConstant: 47).isActive = true
        fullMeaningButton.heightAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    
    func answerImageTopConstraints() {
        
        let heightConstant = UIScreen.main.bounds.height / 3.67
        answerImageTop.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        answerImageTop.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        answerImageTop.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        answerImageTop.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        
    }
    
    func answerTextLabelConstraints() {
        let heightConstant = UIScreen.main.bounds.height / 28.4
        answerTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        answerTextLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: heightConstant).isActive = true
        
    }
    
    func hieroglyphImageConstraints() {
        hierogliphText.heightAnchor.constraint(equalToConstant: 80).isActive = true
        hierogliphText.widthAnchor.constraint(equalToConstant: 65).isActive = true
        hierogliphText.bottomAnchor.constraint(equalTo: stackAllView.bottomAnchor).isActive = true
    }
    
    func chinaTextLabelConstrains() {
        chinaTextLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func englishTextLabelConstrains() {
        englishTextLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func stackAllViewConstraints() {
        
        let heightConstant = UIScreen.main.bounds.height / 35
        stackAllView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackAllView.topAnchor.constraint(equalTo: answerTextLabel.bottomAnchor, constant: heightConstant).isActive = true
        
    }
    
    
    func backButtonConstraint() {
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28).isActive = true
        backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 0.61).isActive = true
    }
    
    func addDataFromModel() {
        self.chinaTextLabel.text = "\(dataResult?.name_chi ?? "坤") (\(dataResult?.pronunciation ?? ""))"
        self.englishTextLabel.text = "”\(dataResult?.name_eng ?? "”Arguing”")”"
        
        self.fullScroll.text = "Hexagram \(dataResult?.id ?? 0) is named \(dataResult?.name_chi ?? "訟") (\(dataResult?.pronunciation ?? "kūn")), ”\(dataResult?.name_eng ?? "”Field”")”.\n\(dataResult?.base_text ?? "Other variations include the receptive, acquiescence, and the flow") \n\(dataResult?.additional_text ?? "Its inner (lower) trigram is ☷ (坤 kūn) field = (地) earth, and its outer (upper) trigram is identical.")"
        self.hierogliphText.text = dataResult?.hexagram ?? "䷁"
    }
    
    @objc private func popupViewTapped(recognizer: UIButton){
        let state = currentState.opposite
        let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
            switch state {
            case .open:
                self.bottomConstraint.constant = self.view.frame.height
                self.fullMeaningButton.setBackgroundImage(UIImage(named: "CloseTopButton"), for: .normal)
            case .closed:
                if UIScreen.main.bounds.height > 800 {
                    self.heightConstant = UIScreen.main.bounds.height / 2.75
                } else {
                    self.heightConstant = UIScreen.main.bounds.height / 2.5
                }
                self.bottomConstraint.constant = self.heightConstant
                self.fullMeaningButton.setBackgroundImage(UIImage(named: "DownButton"), for: .normal)
            }
            self.view.layoutIfNeeded()
        })
        transitionAnimator.addCompletion { position in
            switch position {
            case .start:
                self.currentState = state.opposite
            case .end:
                self.currentState = state
            case .current:
                ()
            @unknown default:
                fatalError()
            }
            switch self.currentState {
            case .open:
                self.bottomConstraint.constant = self.view.frame.height
                self.fullMeaningButton.setBackgroundImage(UIImage(named: "CloseTopButton"), for: .normal)
            case .closed:
                if UIScreen.main.bounds.height > 800 {
                    self.heightConstant = UIScreen.main.bounds.height / 2.75
                } else {
                    self.heightConstant = UIScreen.main.bounds.height / 2.5
                }
                self.bottomConstraint.constant = self.heightConstant
                self.fullMeaningButton.setBackgroundImage(UIImage(named: "DownButton"), for: .normal)
            }
        }
        transitionAnimator.startAnimation()
        
    }
    
    // MARK: Get month fate
    func getResponceFromJson() {
        let monthNetwork = NetworkMonthDataFetcher()
        let urlString = "https://app.thebookofchanges.net/api/month-prediction"
        monthNetwork.fetchData(urlString: urlString) { ( result ) in
        guard let result = result else { return }
            if result.text != nil {
                self.mainScroll.text = result.text
            }
        }
    }
    
    @objc func backButtonTapped() {
       self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
}


