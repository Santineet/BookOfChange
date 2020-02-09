//
//  TermViewController.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 22.01.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class TermViewController: UIViewController {
    
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
        scroll.text = "Introduction \n\nBy downloading, browsing, accessing or using The Book of Changes (Application), you agree to be bound by these Terms and Conditions of Use. We reserve the right to amend these terms and conditions at any time. If you disagree with any of these Terms and Conditions of Use, you must immediately discontinue your access to the Application and your use of the services offered on the Application. Continued use of Application will constitute acceptance of these Terms and Conditions of Use, as may be amended from time to time. \n\nLimitations \n\nThe following restrictions apply to rights granted in accordance with the terms of service: \n\u{2022} you do not have the right to license, sell, rent, transfer, reproduce, distribute or use our application for any other commercial purposes; \n\u{2022} you do not have the right to create or use framing methods to include any Application brand or logo; \n\u{2022} you are not entitled to use meta tags or any other related text when using the name or trademark of Application;\n\u{2022} you are not entitled to participate in potentially harmful actions regarding the properties of Application, including violation or attempt to violate any security functions of Application; \n\u{2022} you do not have the right to access Application to create similar websites, services or applications; \n\u{2022} you are not entitled to issue any copyrights or other property marks contained in Application; \n\u{2022} you do not have the right to use the properties of Application in any way that could damage the application;\n\u{2022} you do not have the right to try to gain unauthorized access to computer systems or networks owned by Application.\n\nRules About Use of The Book of Changes \n\nWe will use reasonable endeavours to correct any errors or omissions as soon as practicable after being notified of them. However, we do not guarantee that the Services or Application will be free of faults, and we do not accept liability for any such faults, errors or omissions.\n\nWe do not warrant that your use of the Services or Application will be uninterrupted and we do not warrant that any information (or messages) transmitted via the Services or Application will be transmitted accurately, reliably, in a timely manner or at all. Notwithstanding that we will try to allow uninterrupted access to the Services and Application, access to the Services and Application may be suspended, restricted or terminated at any time. \n\nWe do not give any warranty that the Services and Application are free from viruses or anything else which may have a harmful effect on any technology. \n\nWe reserve the right to change, modify, substitute, suspend or remove without notice any information on Services or Application from time to time. Your access to the Application and/or the Services may also be occasionally restricted to allow for repairs, maintenance or the introduction of new facilities or services. We will attempt to restore such access as soon as we reasonably can. For the avoidance of doubt, we reserve the right to withdraw any information or Services from Application at any time. \n\nWe reserve the right to block access to and/or to edit or remove any material which in our reasonable opinion may give rise to a breach of these Terms and Conditions of Use. \n\nSuspension and Termination \n\nIf you use (or anyone other than you, with your permission uses) Application, any Services in contravention of these Terms and Conditions of Use, we may suspend your use of the Services and/or Application. \n\nIf we suspend the Services or Application, we may refuse to restore the Services or Application for your use until we receive an assurance from you, in a form we deem acceptable, that there will be no further breach of the provisions of these Terms and Conditions of Use. \n\nWe shall fully cooperate with any law enforcement authorities or court order requesting or directing to disclose the identity or locate anyone in breach of these Terms and Conditions of Use. \n\nWithout limitation to anything else in this point, we shall be entitled immediately or at any time (in whole or in part) to: (a) suspend the Services and/or Application; (b) suspend your use of the Services and/or Application; and/or (c) suspend the use of the Services and/or Application for persons we believe to be connected (in whatever manner) to you, if: \n\u{2022} you commit any breach of these Terms and Conditions of Use; \n\u{2022} we suspect, on reasonable grounds, that you have, might or will commit a breach of these Terms and Conditions of Use; or \n\u{2022} we suspect, on reasonable grounds, that you may have committed or be committing any fraud against us or any person.\n\nOur rights under this point shall not prejudice any other right or remedy we may have in respect of any breach or any rights, obligations or liabilities accrued prior to termination. \n\nDisclaimer and Exclusion of Liability \n\nThe Book of Changes, the Services, the information on Application and use of all related facilities are provided on an \"as is, as available\" basis without any warranties whether express or implied. \n\nTo the fullest extent permitted by applicable law, we disclaim all representations and warranties relating to Application and its contents, including in relation to any inaccuracies or omissions in the Application, warranties of merchantability, quality, fitness for a particular purpose, accuracy, availability, non-infringement or implied warranties from course of dealing or usage of trade. \n\nWe do not warrant that Application will always be accessible, uninterrupted, timely, secure, error free or free from computer virus or other invasive or damaging code or that Application will not be affected by any acts of God or other force majeure events, including inability to obtain or shortage of necessary materials, equipment facilities, power or telecommunications, lack of telecommunications equipment or facilities and failure of information technology or telecommunications equipment or facilities. \n\nWhile we may use reasonable efforts to include accurate and up-to-date information on Application, we make no warranties or representations as to its accuracy, timeliness or completeness. \n\nWe shall not be liable for any acts or omissions of any third parties howsoever caused, and for any direct, indirect, incidental, special, consequential or punitive damages, howsoever caused, resulting from or in connection with the mobile application and the services offered in the mobile application, your access to, use of or inability to use the mobile application or the services offered in the mobile application, reliance on or downloading from the mobile application and/or services, or any delays, inaccuracies in the information or in its transmission including but not limited to damages for loss of business or profits, use, data or other intangible, even if we have been advised of the possibility of such damages. \n\nWe shall not be liable in contract, tort (including negligence or breach of statutory duty) or otherwise howsoever and whatever the cause thereof, for any indirect, consequential, collateral, special or incidental loss or damage suffered or incurred by you in connection with Application and these Terms and Conditions of Use. For the purposes of these Terms and Conditions of Use, indirect or consequential loss or damage includes, without limitation, loss of revenue, profits, anticipated savings or business, loss of data or goodwill, loss of use or value of any equipment including software, claims of third parties, and all associated and incidental costs and expenses. \n\nThe above exclusions and limitations apply only to the extent permitted by law. None of your statutory rights as a consumer that cannot be excluded or limited are affected. \n\nNotwithstanding our efforts to ensure that our system is secure, you acknowledge that all electronic data transfers are potentially susceptible to interception by others. We cannot, and do not, warrant that data transfers pursuant to Application, or electronic mail transmitted to and from us, will not be monitored or read by others. \n\nIndemnity \n\nYou agree to indemnify and keep us indemnified against any claim, action, suit or proceeding brought or threatened to be brought against us which is caused by or arising out of (a) your use of the Services, (b) any other party’s use of the Services using your user ID, verification PIN and/or any identifier number, and/or (c) your breach of any of these Terms and Conditions of Use, and to pay us damages, costs and interest in connection with such claim, action, suit or proceeding. \n\nIntellectual Property Rights n\nAll editorial content, information, photographs, illustrations, artwork and other graphic materials, and names, logos and trademarks on Application are protected by copyright laws and/or other laws and/or international treaties, and belong to us and/or our suppliers, as the case may be. These works, logos, graphics, sounds or images may not be copied, reproduced, retransmitted, distributed, disseminated, sold, published, broadcasted or circulated whether in whole or in part, unless expressly permitted by us and/or our suppliers, as the case may be.\n\nNothing contained on Application should be construed as granting by implication, estoppel, or otherwise, any license or right to use any trademark displayed on Application without our written permission. Misuse of any trademarks or any other content displayed on Application is prohibited. \n\nWe will not hesitate to take legal action against any unauthorised usage of our trade marks, name or symbols to preserve and protect its rights in the matter. All rights not expressly granted herein are reserved. Other product and company names mentioned herein may also be the trademarks of their respective owners. \n\nAmendments \n\nWe may periodically make changes to the contents of Application, including to the descriptions and prices of services advertised, at any time and without notice. We assume no liability or responsibility for any errors or omissions in the content of Application.\n\nWe reserve the right to amend these Terms and Conditions of Use from time to time without notice. The revised Terms and Conditions of Use will be posted on Application and shall take effect from the date of such posting. You are advised to review these terms and conditions periodically as they are binding upon you. \n\nApplicable Law and Jurisdiction \n\nApplication can be accessed from all countries around the world where the local technology permits. As each of these places have differing laws, by accessing Application both you and we agree that the laws of USA, without regard to the conflicts of laws principles thereof, will apply to all matters relating to the use of Application.\n\nYou accept and agree that both you and we shall submit to the exclusive jurisdiction of the courts of USA in respect of any dispute arising out of and/or in connection with these Terms and Conditions of Use. \n\nPricing And Purchase Conditions \n\nThe purpose of the conditions is to provide access to services. All rates specified in these conditions and paid by you in accordance with the conditions will be taken into account only to achieve this objective. Under no circumstances will these fees be paid for the sale, license or use of The Book of Changes software or application, and, in addition, any use you make of The Book of Changes software or application for the conditions will be considered solely to support the purpose. \n\nPayment \n\nYou agree to pay all commissions or payments to your account in accordance with the terms of service. Application collects payments through various payment services. You must provide Application with the correct account information for the selected payment provider. An agreement with a payment service provider governs the use of a particular credit card or other payment method. By providing us with additional payment information, you agree that Application has the right to immediately deduct all your fees and charges due and payable to Application in accordance with this agreement, and that no additional notification or consent is required. You agree to immediately inform Application if any of your payment information needs to be updated in accordance with the terms of service. Application also has the right to change its prices and billing methods at any time, right after the publication of this information on the website or by email. \n\nService Subscription Cost \n\nYou will be responsible for paying the appropriate service fees when creating your account and choosing a validity period for your subscription. Except as provided in this document, all maintenance costs cannot be reimbursed. You and Application will not conclude a service contract until Application or a payment service provider such as Google or Apple accepts your order via email with confirmation, SMS / MMS, or any other form of communication. \n\nTaxes \n\nSecurity rates do not include the applicable sales tax. If any service or payment for any service is subject to sales tax in any jurisdiction and you have not listed the sales tax applicable to Application, you are responsible for paying sales tax and associated fines or interest with the corresponding tax of the authority, and will indemnify Application for any responsibility or expense with said taxes. At our request, you must provide us with official receipts issued by the relevant tax authority or provide any other information that lets us know that you have paid all necessary taxes. \n\nAuto Renewal \n\nYour subscription will be valid for an unlimited time until its expiration. After the initial subscription period, the subscription will automatically begin on the first day after such period and will be active for the same period of time. You agree that this auto-renewal feature will be extended to your account if you do not cancel your subscription at least one day before the renewal. You can always cancel it in the application settings. On the same page, you can change your account settings if you do not want your subscription to be updated automatically every month. If you decide to cancel your subscription, you will still be able to use it until the end of the period. Subscription will not be renewed after the expiration of the current period. However, you will not be entitled to a proportionate reimbursement of any part of the subscription fee paid during the active subscription period. When paying for membership, you authorize The Book of Changes to charge your payment provider each time a new subscription period begins. After the renewal of the subscription, if Application for any reason does not receive funds from your payment service provider, 1) you will have to pay all the funds due from your account, upon request and / or (2) accept that Application may terminate your account or cancel your subscription and continue to try to charge your payment provider until we receive the funds (once the payment has been received, your account will be reactivated and you can renew it automatically when you start a new subscription)."
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
        topText.text = "Terms of use"
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

