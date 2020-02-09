//
//  CheckFateController.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 16.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import UIKit
import AVFoundation

class CheckFateController: UIViewController {
    
    var coinArray = [UIImageView]()
//    var hieroglyphArray = [UIImageView]()
    let widthCoin = UIScreen.main.bounds.width * 0.3
    var activeCoin: UIImageView?
//    var activeHieroglyph: UIImageView?
    var dataModel: DataModel?
    var swipeGesture = UISwipeGestureRecognizer()
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "coinPush", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var timer = Timer()
    let time = 1.2
    var index = 5
    
    let backGroundImage: UIImageView = {
        let back = UIImageView()
        back.image = UIImage(named: "BackgroundMain")
        back.contentMode = .scaleAspectFill
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Think about your question"
        label.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 29)
        label.textColor = #colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.layer.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        label.layer.shadowRadius = 1.0
        label.layer.shadowOpacity = 1.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableImage: UIImageView = {
        let table = UIImageView()
        table.image = UIImage(named: "Table")
        table.contentMode = .scaleAspectFill
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let swipeLabelButton: UIButton = {
        let clickButton = UIButton()
        clickButton.setTitle("Сlick to \nflip a coin", for: .normal)
        clickButton.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 25)
        clickButton.titleLabel?.numberOfLines = 2
        clickButton.titleLabel?.textAlignment = .center
        clickButton.titleLabel?.minimumScaleFactor = 0.5
        clickButton.titleLabel?.adjustsFontSizeToFitWidth = true
        clickButton.setTitleColor(#colorLiteral(red: 0.2156862745, green: 0.08235294118, blue: 0, alpha: 0.6019905822), for: .normal)
        clickButton.setTitleShadowColor(#colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1), for: .normal)
        clickButton.titleLabel?.layer.shadowRadius = 0.1
        clickButton.titleLabel?.layer.shadowOpacity = 0.1
        clickButton.titleLabel?.layer.shadowOffset = CGSize(width: 2, height: 2)
        clickButton.titleLabel?.layer.masksToBounds = false
        clickButton.addTarget(self, action: #selector(clickButtonTapped), for: .touchUpInside)
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        return clickButton
    }()
    
    let hierogliphLabel: UILabel = {
        let hierogliph = UILabel()
        switch UIScreen.main.bounds.height {
        case 0 ..< 600:
             hierogliph.font = UIFont(name: "Symbola", size: 55)
        case 600 ... 800:
             hierogliph.font = UIFont(name: "Symbola", size: 70)
        default:
             hierogliph.font = UIFont(name: "Symbola", size: 90)
        }
        hierogliph.textColor = #colorLiteral(red: 0.2326992821, green: 0.08986942833, blue: 0.002631742454, alpha: 0.836526113)
        hierogliph.shadowColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 1)
        hierogliph.layer.shadowRadius = 0.1
        hierogliph.layer.shadowOpacity = 0.1
        hierogliph.shadowOffset = CGSize(width: 2, height: 2)
        hierogliph.textAlignment = .center
        hierogliph.contentMode = .scaleAspectFill
        hierogliph.translatesAutoresizingMaskIntoConstraints = false
        return hierogliph
    }()
    
    let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.8470588235, blue: 0.6784313725, alpha: 0.6033818493)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let autoButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 28)
        button.setTitle("Auto", for: .normal)
        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        button.titleLabel?.layer.shadowRadius = 1.0
        button.titleLabel?.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.setBackgroundImage(UIImage(named: "autoBlock"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(autoButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let oneThrowButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 22)
        button.setTitle("One\nthrow", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9215686275, alpha: 1)
        button.titleLabel?.minimumScaleFactor = 0.75
        button.titleLabel?.setLineSpacing(lineHeightMultiple: 0.85)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.layer.shadowColor = #colorLiteral(red: 0.1490196078, green: 0.1058823529, blue: 0.08235294118, alpha: 1)
        button.titleLabel?.layer.shadowRadius = 1.0
        button.titleLabel?.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.setBackgroundImage(UIImage(named: "BlockProMain"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(oneThrowButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addInSubview()
        createCoinsAndHierogliph()
        putCoinStart()
        swipeCoinMethod()
        backGroundImageConstraints()
        topLabelConstraint()
        tableImageConstraints()
        autoButtonConstraint()
        oneThrowButtonConstraints()
        swipeLabelConstraints()
        hierogliphLabelConstraints()
        shadowViewConstraints()
        hierogliphLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getJsonResponce()
    }
    
    func addInSubview() {
        view.addSubview(backGroundImage)
        view.addSubview(topLabel)
        view.addSubview(tableImage)
        view.addSubview(autoButton)
        view.addSubview(oneThrowButton)
        view.addSubview(swipeLabelButton)
        view.addSubview(hierogliphLabel)
        view.addSubview(shadowView)
    }
    
    
    func backGroundImageConstraints() {
        
        backGroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func topLabelConstraint() {
        
        let constant = UIScreen.main.bounds.height / 15
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    
    func tableImageConstraints() {
        
        let tableTopConstant = UIScreen.main.bounds.height / 19
        
        tableImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: tableTopConstant).isActive = true
        tableImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.89).isActive = true
        tableImage.heightAnchor.constraint(equalTo: tableImage.widthAnchor, multiplier: 1.04).isActive = true
        
    }
    
    func swipeLabelConstraints() {
        if UIScreen.main.bounds.height > 800 {
            let constants = UIScreen.main.bounds.height / 5
            swipeLabelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants).isActive = true
        } else {
            let constants = UIScreen.main.bounds.height / 6.5
            swipeLabelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants).isActive = true
        }
        swipeLabelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swipeLabelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.36).isActive = true
    }
    
    func hierogliphLabelConstraints() {
        
        if UIScreen.main.bounds.height > 800 {
            let constants = UIScreen.main.bounds.height / 5
            hierogliphLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants).isActive = true
        } else {
            let constants = UIScreen.main.bounds.height / 6
            hierogliphLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants).isActive = true
        }
        hierogliphLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hierogliphLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.36).isActive = true
        
        
//        hierogliphLabel.topAnchor.constraint(equalTo: swipeLabelButton.topAnchor).isActive = true
//        hierogliphLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        hierogliphLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    func shadowViewConstraints() {
        
        if UIScreen.main.bounds.height > 800 {
             let constants = UIScreen.main.bounds.height / 5
             shadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants).isActive = true
         } else {
            let constants = UIScreen.main.bounds.height / 3.0
             shadowView.topAnchor.constraint(equalTo: tableImage.bottomAnchor, constant: constants).isActive = true
         }
         shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         shadowView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.13).isActive = true
        shadowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
    }

    
    func autoButtonConstraint() {
        autoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        autoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        autoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28).isActive = true
        autoButton.heightAnchor.constraint(equalTo: autoButton.widthAnchor, multiplier: 0.61).isActive = true
    }
    
    func oneThrowButtonConstraints() {
        oneThrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        oneThrowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        oneThrowButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28).isActive = true
        oneThrowButton.heightAnchor.constraint(equalTo: autoButton.widthAnchor, multiplier: 0.61).isActive = true
    }
    
    // MARK: Get symbol, hierogliph and other
    
    func getJsonResponce() {
        
        let networkDataFetcher = NetworkDataFetcher()
        let allDataString = "https://app.thebookofchanges.net/api/rand-symbol"
        
        networkDataFetcher.fetchData(urlString: allDataString) { ( result ) in
            guard let result = result else { return }
            self.dataModel = DataModel(id: result.id, name_eng: result.name_eng, name_chi: result.name_chi, pronunciation: result.pronunciation, base_text: result.base_text, additional_text: result.additional_text, hexagram: result.hexagram)
            self.hierogliphLabel.text = result.hexagram
        }
    }
    
    // Create 6 coin
    
    func createCoinsAndHierogliph() {
        
        for _ in 0..<6 {
            let coin = UIImageView(frame: CGRect(x: 0, y: 0, width: widthCoin, height: widthCoin))
            coin.center = CGPoint(x: view.center.x, y: view.frame.height - coin.frame.height / 3) // Fix it
            coin.image = UIImage(named: "Coin")
            coin.contentMode = .scaleAspectFill
            coinArray.append(coin)
            
//            let hieroglyph = UIImageView(frame: CGRect(x: 0, y: 0, width: widthCoin / 1.75, height: widthCoin / 1.75 * 1.2))
//
//            if UIScreen.main.bounds.height > 800 {
//                hieroglyph.center = CGPoint(x: view.center.x, y: view.frame.height - hieroglyph.frame.height * 2.5) // Fix it
//            } else {
//            hieroglyph.center = CGPoint(x: view.center.x, y: view.frame.height - hieroglyph.frame.height * 1.9) // Fix it
//            }
//            hieroglyph.image = UIImage(named: "HexagramLoad\(i)")
//            hieroglyph.contentMode = .scaleAspectFill
//            hieroglyphArray.append(hieroglyph)
        }
    }
    
    
    // Get 1 coin from array
    func putCoinStart() {
        
        if coinArray.count > 0 {
            activeCoin = coinArray.removeFirst()
            if coinArray.count < 5 {
                swipeLabelButton.isHidden = true
                hierogliphLabel.isHidden = false
//                activeHieroglyph?.removeFromSuperview()
//                activeHieroglyph = hieroglyphArray.removeFirst()
//                view.addSubview(activeHieroglyph!)
            }
            view.addSubview(activeCoin!)
            self.userActivityDisable(with: true)
        } else {
//            activeHieroglyph?.removeFromSuperview()
//            activeHieroglyph = hieroglyphArray.removeFirst()
//            view.addSubview(activeHieroglyph!)
            self.userActivityDisable(with: false)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] (_) in
                let vc = MeaningController()
                vc.modalPresentationStyle = .fullScreen
                vc.dataResult = self?.dataModel
                self?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
    // Animation coin
    func flipTransition() {
        
        var transitionOptions = UIView.AnimationOptions()
        transitionOptions = [.transitionFlipFromTop, .showHideTransitionViews]
        
        
        UIView.transition(with: activeCoin!, duration: 0.6, options: transitionOptions, animations: {
            
        })

        UIView.animate(withDuration: 0.8, delay: 0.2, options: [.curveEaseOut], animations: {
                self.activeCoin!.center = self.generateCoinPlace()
                self.coinSound()
        }) { (_) in
        }
        UIView.animate(withDuration: 0.6, delay: 0.3, options: [], animations: {
            self.activeCoin!.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { [weak self] (_) in
            self?.putCoinStart()
        }
        
    }
    
    // generate coin place in table
    
    func generateCoinPlace() -> CGPoint {
        
        let widthTableConstant = view.frame.width * 0.89
        let heightTableConstant = widthTableConstant * 1.04
        
        let minX = view.center.x - widthTableConstant / 2 + widthCoin / 4
        let maxX = view.center.x + widthTableConstant / 2 - widthCoin / 4
        let minY = tableImage.center.y - heightTableConstant / 2 + widthCoin / 4
        let maxY = tableImage.center.y + heightTableConstant / 2 - widthCoin / 4
        
        let randomX = CGFloat.random(in: minX..<maxX)
        let randomY = CGFloat.random(in: minY..<maxY)
        let random = CGPoint(x: randomX, y: randomY)
        return random
    }
    
    
    func userActivityDisable(with: Bool){
        autoButton.isUserInteractionEnabled = with
        oneThrowButton.isUserInteractionEnabled = with
        swipeGesture.isEnabled = with
    }
    
    func swipeCoinMethod() {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
    }
    
    func coinSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pianoSound)
            audioPlayer.play()
        } catch {
            print("Some error play sound")
        }
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            flipTransition()
            userActivityDisable(with: false)
            index -= 1
        }
    }
    
    @objc func autoButtonTapped() {
        timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerPutCoin), userInfo: nil, repeats: true)
    }
    
    @objc func timerPutCoin() {
        if index >= coinArray.count {
            self.flipTransition()
            self.userActivityDisable(with: false)
            index -= 1
        } else {
            timer.invalidate()
            return
        }
    }
    
    @objc func clickButtonTapped() {
        flipTransition()
        userActivityDisable(with: false)
        index -= 1
    }
    
    @objc func oneThrowButtonTapped() {
        flipTransition()
        userActivityDisable(with: false)
        index -= 1
    }
}



