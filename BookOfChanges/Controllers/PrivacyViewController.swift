//
//  PrivacyViewController.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 22.01.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController {
    
    let backGroundImage: UIImageView = {
        let back = UIImageView()
        back.image = UIImage(named: "BackgroundMain")
        back.contentMode = .scaleAspectFill
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    var mainScroll: UITextView = {
        let scroll = UITextView()
        scroll.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        scroll.text = "Developer built The Book of Changes app as a commercial software. This Service is provided by Developer and is intended for use as is. This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service. \n\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at The Book of Changes unless otherwise defined in this Privacy Policy.\n\nInformation Collection and Use \n\nFor a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy. The app does use third party services that may collect information used to identify you. \n\nLog Data \n\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics. \n\nCookies \n\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory. \n\nThis Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service. \n\nService Providers \n\nWe may employ third-party companies and individuals due to the following reasons: \n\u{2022} to facilitate our Service; \n\u{2022} to provide the Service on our behalf; \n\u{2022} to perform Service-related services; or \n\u{2022} to assist us in analyzing how our Service is used. \n\u{2022} We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose. \n\nSecurity \n\nWe value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security. \n\nLinks to Other Sites \n\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services. \n\nChildren’s Privacy \n\nThese Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions. \n\nChanges to This Privacy Policy \n\nWe may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page. \n\nContact Us \n\nIf you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us."
        scroll.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 18)
        scroll.textAlignment = .left
        scroll.backgroundColor = .clear
        scroll.indicatorStyle = .black
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.isEditable = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
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
        topText.text = "Privacy policy"
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
        addSubwies()
        
        backGroundImageConstraints()
        mainScrollConstraints()
        proImageConstraints()
        proLabelTextConstraints()
        backButtonConstraint()
    }
    
    
    
    func addSubwies() {
        view.addSubview(backGroundImage)
        view.addSubview(mainScroll)
        view.addSubview(proImageTop)
        view.addSubview(topTextLabel)
        view.addSubview(backButton)
    }
    
    func backGroundImageConstraints() {
        backGroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func mainScrollConstraints() {
        mainScroll.topAnchor.constraint(equalTo: proImageTop.bottomAnchor, constant: 10).isActive = true
        mainScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        mainScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        mainScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
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
    
    func backButtonConstraint() {
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28).isActive = true
        backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 0.61).isActive = true
    }
    
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
