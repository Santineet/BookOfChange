//
//  IAPPManager.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 01.02.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import Foundation
import StoreKit

class IAPPMAnager: NSObject {
    
 //   let inAppPurchasesSharedSecret = "b20896ed18bb4d708c45b406df4a152d"
    let myKeySecretApp = "78f3b3a9f3bc4c7983dec2dc9163faec"
    static let productNotificationIdentifire = "IAPManagerIdentifire"
    static let shared = IAPPMAnager()
    static var statusText = ""
    private override init() {}
    
    var products: [SKProduct] = []
    let paymentQueue = SKPaymentQueue.default()
    
    public func setupPurchases(callback: @escaping(Bool) -> ()) {
        if SKPaymentQueue.canMakePayments() {
            SKPaymentQueue.default().add(self)
            callback(true)
            return
        }
        callback(false)
   }
    
    public func getProducts() {
        
        let identifire: Set = [
            NonRenewableSubscribtionID.thebookofchanges_week_01.rawValue,
            NonRenewableSubscribtionID.thebookofchanges_month_01.rawValue,
            NonRenewableSubscribtionID.thebookofchanges_year_01.rawValue
        ]
        
        let productRequest = SKProductsRequest(productIdentifiers: identifire)
        productRequest.delegate = self
        productRequest.start()
//        let productIdentifiers = NSSet(objects:
//        productIdentifier)
//        guard let identifier = productIdentifiers as? Set<String> else { return }
//        let productRequest = SKProductsRequest(productIdentifiers: identifier)
//        productRequest.delegate = self
//        productRequest.start()
    }
    
    public func purchase(productWith identifire: String) {
        guard let product = products.filter({ $0.productIdentifier == identifire}).first else { return }
        let payment = SKPayment(product: product)
        paymentQueue.add(payment)
    }
    
    public func restoreCompleteTransaction() {
        paymentQueue.restoreCompletedTransactions()
    }
        
}

extension IAPPMAnager: SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .deferred: break
            case .purchasing: break
            case .failed: failed(transaction: transaction)
            case .purchased: completed(transaction: transaction)
            case .restored: restored(transaction: transaction)
            @unknown default:
                print("Switch not full data")
            }
        }
    }
    
    private func failed(transaction: SKPaymentTransaction) {
        if let transactionError = transaction.error as NSError? {
            if transactionError.code != SKError.paymentCancelled.rawValue {
                print("Transaction error: \(transaction.error!.localizedDescription)")
            }
        }
        paymentQueue.finishTransaction(transaction)
    }
    
    private func completed(transaction: SKPaymentTransaction) {
        paymentQueue.finishTransaction(transaction)
        print(transaction.payment.productIdentifier)
        self.receiptValidation(secretKey: myKeySecretApp)
    }
    
    private func restored(transaction: SKPaymentTransaction) {
        paymentQueue.finishTransaction(transaction)
        self.receiptValidation(secretKey: myKeySecretApp)
    }
    
    public func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if (queue.transactions.count == 0)
        {
                                        
            NotificationCenter.default.post(name: NSNotification.Name("NothingToRestore"), object: nil)

            print("Nothing to restore...")
        }
    }
    
    //SANTINEET
    func getExpirationDate(productId: String, purchaseDate: Date) -> Date? {
        switch productId {
        case NonRenewableSubscribtionID.thebookofchanges_week_01.rawValue :
            let expirationDate = Calendar.current.date(byAdding: .day, value: 7, to: purchaseDate)
        
            return expirationDate
        case NonRenewableSubscribtionID.thebookofchanges_month_01.rawValue:
            let expirationDate = Calendar.current.date(byAdding: .month, value: 1, to: purchaseDate)
         
            return expirationDate
        case NonRenewableSubscribtionID.thebookofchanges_year_01.rawValue:
            let expirationDate = Calendar.current.date(byAdding: .year, value: 1, to: purchaseDate)
            
            return expirationDate
        default:
            return nil
        }
    }
    
    
    func receiptValidation(secretKey: String) {
        
        #if DEBUG
        let verifyReceiptURL = "https://sandbox.itunes.apple.com/verifyReceipt"
        #else
        let verifyReceiptURL = "https://buy.itunes.apple.com/verifyReceipt"
        #endif
        
        let receiptFileURL = Bundle.main.appStoreReceiptURL
        let receiptData = try? Data(contentsOf: receiptFileURL!)
        let recieptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        let jsonDict: [String: AnyObject] = ["receipt-data" : recieptString! as AnyObject, "password" : secretKey as AnyObject]
        
        do {
            
            let requestData = try JSONSerialization.data(withJSONObject: jsonDict, options: JSONSerialization.WritingOptions.prettyPrinted)
            let storeURL = URL(string: verifyReceiptURL)!
            var storeRequest = URLRequest(url: storeURL)
            storeRequest.httpMethod = "POST"
            storeRequest.httpBody = requestData
            
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: storeRequest, completionHandler: { [weak self] (data, response, error) in

                if data == nil {
                    
                    if let expDate = UserDefaults.standard.string(forKey: "EXPDATE") {
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
                        guard let date = formatter.date(from: expDate) else { return }
                        if date.compare(Date()) == .orderedDescending {
                            DispatchQueue.main.async {
                                let mainVC = MainController()
                                UIApplication.shared.keyWindow?.rootViewController = mainVC
                                return
                            }
                        } else {
                            
                            DispatchQueue.main.async {
                                let purchaseVC = ProViewController()
                                UIApplication.shared.keyWindow?.rootViewController = purchaseVC
                            }
                            
                            return
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            let purchaseVC = ProViewController()
                            UIApplication.shared.keyWindow?.rootViewController = purchaseVC
                        }
                        
                        return
                    }
                    
                    return
                }
                
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print("=",jsonResponse)
                    if var date = self?.getExpirationDateFromResponse(jsonResponse as! NSDictionary) {

                        if UserDefaults.standard.bool(forKey: "checkValidation") {
                            if let dateWithFreeTrial = Calendar.current.date(byAdding: .day, value: 3, to: date) {
                                date = dateWithFreeTrial
                            }
                        }
                        
                        if date.compare(Date()) == .orderedDescending {

//                            NotificationCenter.default.post(name: NSNotification.Name(IAPPMAnager.productNotificationIdentifire), object: nil)
                            UserDefaults.standard.set(true, forKey: "checkValidation")
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
                            let axpDateString = formatter.string(from: date)
                            UserDefaults.standard.set(axpDateString, forKey: "EXPDATE")
                            DispatchQueue.main.async {
                                let mainVC = MainController()
                                UIApplication.shared.keyWindow?.rootViewController = mainVC
                            }
                            
                            
                            IAPPMAnager.statusText = "Subscription time not ended!"
                        } else {
                            UserDefaults.standard.set(false, forKey: "checkValidation")
                            let purchaseVC = ProViewController()
                            UIApplication.shared.keyWindow?.rootViewController = purchaseVC
                            IAPPMAnager.statusText = "Subscription has ended!"
                        }
                    }
                } catch let parseError {
                    print(parseError)
                }
            })
            task.resume()
        } catch let parseError {
            print(parseError)
        }
    }
    
    func getExpirationDateFromResponse(_ jsonResponse: NSDictionary) -> Date? {
        
        if let receiptInfo: NSDictionary = jsonResponse["receipt"] as? NSDictionary {
            
            print("\(receiptInfo)")
            if let inApp = receiptInfo["in_app"] as? NSArray {
                let lastReceipt = inApp.lastObject as! NSDictionary
                let purchaseDate = lastReceipt["original_purchase_date"] as! String
                let prodictId = lastReceipt["product_id"] as! String
           
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
               
                guard let date = formatter.date(from: purchaseDate) else { return nil }
                
                
                let expirationDate = self.getExpirationDate(productId: prodictId, purchaseDate: date)
                
                return expirationDate
            }
            return nil
        } else {
            return nil
        }
    }
    
    
}

extension IAPPMAnager: SKProductsRequestDelegate {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            self.products = response.products
            products.forEach { print($0.localizedTitle) }
        }
    }
    
}
