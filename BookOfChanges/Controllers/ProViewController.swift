//
//  ProViewController.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 15.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import StoreKit

class ProViewController: UIViewController {
    
    let iappManager = IAPPMAnager.shared
    
    let backGroundImage: UIImageView = {
        let back = UIImageView()
        back.image = UIImage(named: "BackgroundMain")
        back.contentMode = .scaleAspectFill
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let scrollTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let proImageTop: UIImageView = {
        let proImage = UIImageView()
        proImage.image = UIImage(named: "proTopLabel")
        proImage.contentMode = .scaleAspectFill
        proImage.translatesAutoresizingMaskIntoConstraints = false
        return proImage
    }()
    
    let topTextLabel: UILabel = {
        let topText = UILabel()
        topText.text = "Activate Free Trial"
        topText.textColor = #colorLiteral(red: 0.9058823529, green: 0.8235294118, blue: 0.7607843137, alpha: 1)
        topText.textAlignment = .center
        topText.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        topText.layer.shadowRadius = 1.0
        topText.layer.shadowOpacity = 1.0
        topText.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        topText.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        topText.translatesAutoresizingMaskIntoConstraints = false
        return topText
    }()
    
    let trialTextLabel: UILabel = {
        let topText = UILabel()
        topText.text = "Activate Your Free \nThree-Day Trial"
        topText.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        topText.numberOfLines = 0
        topText.minimumScaleFactor = 0.5
        topText.adjustsFontSizeToFitWidth = true
        topText.textAlignment = .center
        topText.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        topText.layer.shadowRadius = 5.0
        topText.layer.shadowOpacity = 1.0
        topText.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 34)
        topText.translatesAutoresizingMaskIntoConstraints = false
        return topText
    }()
    
    let weekLabel: UILabel = {
        let week = UILabel()
        week.text = "per week"
        week.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        week.minimumScaleFactor = 0.5
        week.textAlignment = .left
        week.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        week.layer.shadowRadius = 1.0
        week.layer.shadowOpacity = 0.6
        week.font = UIFont(name: "IM_FELL_Double_Pica_Roman", size: 26)
        week.translatesAutoresizingMaskIntoConstraints = false
        return week
    }()
    
    let monthLabel: UILabel = {
        let month = UILabel()
        month.text = "per month"
        month.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        month.minimumScaleFactor = 0.5
        month.textAlignment = .left
        month.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        month.layer.shadowRadius = 1.0
        month.layer.shadowOpacity = 0.6
        month.font = UIFont(name: "IM_FELL_Double_Pica_Roman", size: 26)
        month.translatesAutoresizingMaskIntoConstraints = false
        return month
    }()
    
    let yearLabel: UILabel = {
        let year = UILabel()
        year.text = "per year"
        year.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        year.minimumScaleFactor = 0.5
        year.textAlignment = .left
        year.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        year.layer.shadowRadius = 1.0
        year.layer.shadowOpacity = 0.6
        year.font = UIFont(name: "IM_FELL_Double_Pica_Roman", size: 26)
        year.translatesAutoresizingMaskIntoConstraints = false
        return year
    }()
    
    let dateStack: UIStackView = {
        let date = UIStackView()
        date.axis = NSLayoutConstraint.Axis.vertical
        date.distribution = UIStackView.Distribution.equalSpacing
        date.alignment = UIStackView.Alignment.leading
        date.spacing = 34.0
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    let weekAmount: UILabel = {
        let week = UILabel()
        week.text = "4.99$"
        week.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        week.minimumScaleFactor = 0.5
        week.textAlignment = .right
        week.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        week.layer.shadowRadius = 1.0
        week.layer.shadowOpacity = 0.6
        week.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 30)
        week.translatesAutoresizingMaskIntoConstraints = false
        return week
    }()
    
    let monthAmount: UILabel = {
        let month = UILabel()
        month.text = "9.99$"
        month.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        month.minimumScaleFactor = 0.5
        month.textAlignment = .right
        month.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        month.layer.shadowRadius = 1.0
        month.layer.shadowOpacity = 0.6
        month.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 30)
        month.translatesAutoresizingMaskIntoConstraints = false
        return month
    }()
    
    let yearAmount: UILabel = {
        let year = UILabel()
        year.text = "49.99$"
        year.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        year.minimumScaleFactor = 0.5
        year.textAlignment = .left
        year.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        year.layer.shadowRadius = 1.0
        year.layer.shadowOpacity = 0.6
        year.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 30)
        year.translatesAutoresizingMaskIntoConstraints = false
        return year
    }()
    
    let amountStack: UIStackView = {
        let date = UIStackView()
        date.axis = NSLayoutConstraint.Axis.vertical
        date.distribution = UIStackView.Distribution.equalSpacing
        date.alignment = UIStackView.Alignment.trailing
        date.spacing = 29.0
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    let proWeekButton: UIButton = {
        let week = UIButton()
        week.contentMode = .scaleAspectFill
        week.setBackgroundImage(UIImage(named: "BrownButton"), for: .normal)
        week.addTarget(self, action: #selector(proWeekButtonTapped), for: .touchUpInside)
        week.translatesAutoresizingMaskIntoConstraints = false
        return week
    }()
    
    let proMonthButton: UIButton = {
        let month = UIButton()
        month.contentMode = .scaleAspectFill
        month.setBackgroundImage(UIImage(named: "BrownButton"), for: .normal)
        month.addTarget(self, action: #selector(proMonthButtonTapped), for: .touchUpInside)
        month.translatesAutoresizingMaskIntoConstraints = false
        return month
    }()
    
    let proYearButton: UIButton = {
        let year = UIButton()
        year.contentMode = .scaleAspectFill
        year.setBackgroundImage(UIImage(named: "BrownButton"), for: .normal)
        year.addTarget(self, action: #selector(proYearButtonTapped), for: .touchUpInside)
        year.translatesAutoresizingMaskIntoConstraints = false
        return year
    }()
    
    let proButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.trailing
        stack.spacing = 20.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let proTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Information about products not manufactured by Apple, or independent websites not controlled or tested by Apple, is provided without recommendation or endorsement. Apple assumes no responsibility with regard to the selection, performance, or use of third-party websites or products. Apple makes no representations regarding third-party website accuracy or reliability. Risks are inherent in the use of the Internet. Contact the vendor for additional information. Other company and product names may be trademarks of their respective owners."
        label.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 18)
        label.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        label.textAlignment = .left
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.textAlignment = .left
        label.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        label.layer.shadowRadius = 1.0
        label.layer.shadowOpacity = 1.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let privacyButton: UIButton = {
        let privacy = UIButton()
        privacy.setTitle("Privacy policy", for: .normal)
        privacy.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_Roman", size: 26)
        privacy.setTitleColor(#colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1), for: .normal)
        privacy.titleLabel?.textAlignment = .center
        privacy.titleLabel?.minimumScaleFactor = 0.5
        privacy.titleLabel?.adjustsFontSizeToFitWidth = true
        privacy.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        privacy.layer.shadowRadius = 1.0
        privacy.layer.shadowOpacity = 1.0
        privacy.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
        privacy.translatesAutoresizingMaskIntoConstraints = false
        return privacy
    }()
    
    let termButton: UIButton = {
        let term = UIButton()
        term.setTitle("Terms of use", for: .normal)
        term.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_Roman", size: 26)
        term.titleLabel?.textAlignment = .center
        term.titleLabel?.minimumScaleFactor = 0.5
        term.titleLabel?.adjustsFontSizeToFitWidth = true
        term.setTitleColor(#colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1), for: .normal)
        term.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        term.layer.shadowRadius = 1.0
        term.layer.shadowOpacity = 1.0
        term.addTarget(self, action: #selector(termButtonTapped), for: .touchUpInside)
        term.translatesAutoresizingMaskIntoConstraints = false
        return term
    }()
    
    let termStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let bottomButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.setBackgroundImage(UIImage(named: "BottomButton"), for: .normal)
        button.setTitle("Restore", for: .normal)
        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        button.titleLabel?.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        button.titleLabel?.layer.shadowRadius = 1.0
        button.titleLabel?.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 30)
        button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubwies()
        backGroundImageConstraints()
        scrollConstrains()
        scrollTopViewConstraints()
        proImageConstraints()
        proLabelTextConstraints()
        trialTextLabelConstraints()
        weekLabelConstrainta()
        monthLabelConstraints()
        yearLabelConstraints()
        weekAmountConstraints()
        monthAmountConstraints()
        yearAmountConstraints()
        proWeekButtonConstraints()
        proMonthButtonConstraints()
        proYearButtonConstraints()
        
        dataStackConstraints()
        amountStackConstraints()
        proButtonConstraints()
        
        proTextLabelConstraint()
        privacyButtonConstraint()
        termButtonConstraint()
        
        termStackConstraint()
        bottomButtonConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(nothingToRestore), name: Notification.Name("NothingToRestore"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func addSubwies() {
        view.addSubview(backGroundImage)
        view.addSubview(scrollView)
        scrollView.addSubview(scrollTopView)
        
        view.addSubview(proImageTop)
        view.addSubview(topTextLabel)
        scrollTopView.addSubview(trialTextLabel)
        
        dateStack.addArrangedSubview(weekLabel)
        dateStack.addArrangedSubview(monthLabel)
        dateStack.addArrangedSubview(yearLabel)
        
        amountStack.addArrangedSubview(weekAmount)
        amountStack.addArrangedSubview(monthAmount)
        amountStack.addArrangedSubview(yearAmount)
        
        proButtonStack.addArrangedSubview(proWeekButton)
        proButtonStack.addArrangedSubview(proMonthButton)
        proButtonStack.addArrangedSubview(proYearButton)
        
        scrollTopView.addSubview(dateStack)
        scrollTopView.addSubview(amountStack)
        scrollTopView.addSubview(proButtonStack)
        
        scrollTopView.addSubview(proTextLabel)
        
        termStack.addArrangedSubview(privacyButton)
        termStack.addArrangedSubview(termButton)
        
        scrollTopView.addSubview(termStack)
        scrollView.addSubview(bottomButton)
    }
    
    func backGroundImageConstraints() {
        backGroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    
    func scrollConstrains() {
        scrollView.topAnchor.constraint(equalTo: backGroundImage.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: backGroundImage.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: backGroundImage.leadingAnchor).isActive = true
    }
    
    
    func scrollTopViewConstraints() {
        scrollTopView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollTopView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollTopView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollTopView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollTopView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let height = scrollTopView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        height.priority = UILayoutPriority(250)
        height.isActive = true
    }
    
    func proImageConstraints() {
        
        let heightConstant = UIScreen.main.bounds.height / 7
        proImageTop.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        proImageTop.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        proImageTop.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        proImageTop.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
    
    func proLabelTextConstraints() {
        topTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topTextLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        
    }
    
    func trialTextLabelConstraints() {
        
        let widthConstants = UIScreen.main.bounds.width * 0.76
        trialTextLabel.topAnchor.constraint(equalTo: scrollTopView.topAnchor, constant: 110).isActive = true
        trialTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        trialTextLabel.widthAnchor.constraint(equalToConstant:widthConstants).isActive = true
        trialTextLabel.heightAnchor.constraint(equalTo: trialTextLabel.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    func weekLabelConstrainta() {
        weekLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true
        weekLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 90).isActive = true
    }
    
    func monthLabelConstraints() {
        monthLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true
        monthLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 108).isActive = true
    }
    
    func yearLabelConstraints() {
        yearLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true
        yearLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true
    }
    
    func dataStackConstraints() {
        dateStack.leadingAnchor.constraint(equalTo: scrollTopView.leadingAnchor, constant: 20).isActive = true
        dateStack.topAnchor.constraint(equalTo: trialTextLabel.bottomAnchor, constant: 35).isActive = true
    }
    
    func weekAmountConstraints() {
        weekAmount.heightAnchor.constraint(equalToConstant: 38).isActive = true
        weekAmount.widthAnchor.constraint(greaterThanOrEqualToConstant: 68).isActive = true
    }
    
    func monthAmountConstraints() {
        monthAmount.heightAnchor.constraint(equalToConstant: 38).isActive = true
        monthAmount.widthAnchor.constraint(greaterThanOrEqualToConstant: 81).isActive = true
    }
    
    func yearAmountConstraints() {
        yearAmount.heightAnchor.constraint(equalToConstant: 38).isActive = true
        yearAmount.widthAnchor.constraint(greaterThanOrEqualToConstant: 93).isActive = true
    }
    
    func amountStackConstraints() {
        amountStack.topAnchor.constraint(equalTo: trialTextLabel.bottomAnchor, constant: 32).isActive = true
    }
    
    func proWeekButtonConstraints() {
        proWeekButton.heightAnchor.constraint(equalToConstant: 47).isActive = true
        proWeekButton.widthAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    func proMonthButtonConstraints() {
        proMonthButton .heightAnchor.constraint(equalToConstant: 47).isActive = true
        proMonthButton.widthAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    func proYearButtonConstraints() {
        proYearButton.heightAnchor.constraint(equalToConstant: 47).isActive = true
        proYearButton.widthAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    func proButtonConstraints() {
        proButtonStack.leadingAnchor.constraint(lessThanOrEqualTo: amountStack.trailingAnchor, constant: 20).isActive = true
        proButtonStack.trailingAnchor.constraint(equalTo: scrollTopView.trailingAnchor, constant: -20).isActive = true
        proButtonStack.topAnchor.constraint(equalTo: trialTextLabel.bottomAnchor, constant: 30).isActive = true
    }
    
    func proTextLabelConstraint() {
        proTextLabel.topAnchor.constraint(equalTo: amountStack.bottomAnchor, constant: 36).isActive = true
        proTextLabel.trailingAnchor.constraint(equalTo: scrollTopView.trailingAnchor, constant: -20).isActive = true
        proTextLabel.leadingAnchor.constraint(equalTo: scrollTopView.leadingAnchor, constant: 20).isActive = true
        proTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 335).isActive = true
    }
    
    func privacyButtonConstraint() {
        privacyButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
    }
    
    func termButtonConstraint() {
        termButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
    }
    
    
    
    func termStackConstraint() {
        termStack.leadingAnchor.constraint(equalTo: scrollTopView.leadingAnchor, constant: 20).isActive = true
        termStack.trailingAnchor.constraint(equalTo: scrollTopView.trailingAnchor, constant: -20).isActive = true
        termStack.topAnchor.constraint(equalTo: proTextLabel.bottomAnchor, constant: 30).isActive = true
        
    }
    
    func bottomButtonConstraints() {
        let heightContant = UIScreen.main.bounds.width / 3.75
        bottomButton.topAnchor.constraint(equalTo: termStack.bottomAnchor, constant: 25).isActive = true
        bottomButton.trailingAnchor.constraint(equalTo: scrollTopView.trailingAnchor).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: scrollTopView.bottomAnchor).isActive = true
        bottomButton.leadingAnchor.constraint(equalTo: scrollTopView.leadingAnchor).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: heightContant).isActive = true
    }
    
    
    @objc private func proWeekButtonTapped() {        iappManager.purchase(productWith: NonRenewableSubscribtionID.thebookofchanges_week_01.rawValue)
        print("Week button tapped")
    }
    
    @objc private func proMonthButtonTapped() {
        iappManager.purchase(productWith: NonRenewableSubscribtionID.thebookofchanges_month_01.rawValue)
        print("Month button tapped")
    }
    
    @objc private func proYearButtonTapped() {
        iappManager.purchase(productWith: NonRenewableSubscribtionID.thebookofchanges_year_01.rawValue)
        print("Year button tapped")
    }
    
    @objc func privacyButtonTapped() {
        let pc = PrivacyViewController()
        pc.modalPresentationStyle = .fullScreen
        present(pc, animated: true, completion: nil)
    }
    
    @objc func termButtonTapped() {
        let tc = TermViewController()
        tc.modalPresentationStyle = .fullScreen
        present(tc, animated: true, completion: nil)
    }
    
    @objc func bottomButtonTapped() {
       iappManager.restoreCompleteTransaction()
//        showAlert(title: "Restore information", message: IAPPMAnager.statusText)
    }
    
    @objc private func nothingToRestore() {
        showAlert(title: "Nothing to restore...", message: "")
    }
    
//    @objc private func openControllerAfterPaymentCompleted() {
//        DispatchQueue.main.async {
//            let mc = MainController()
//            mc.modalPresentationStyle = .fullScreen
//            self.present(mc, animated: true, completion: nil)
//        }
//    }
}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
}
