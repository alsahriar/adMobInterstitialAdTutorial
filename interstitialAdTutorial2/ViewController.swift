//
//  ViewController.swift
//  interstitialAdTutorial2
//
//  Created by Kc on 11/01/2016.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitialAd: GADInterstitial?
    
    struct Constants {
        static let adRate = 17
    }
    
    @IBAction func showAdButton(sender: UIButton) {
        randomPresentationOfAdWithFrequency(Constants.adRate)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstitialAd = createAndLoadInterstitial()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let request = GADRequest()
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.loadRequest(request)
        return interstitial
    }
    
    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        interstitialAd = createAndLoadInterstitial()
    }
    
    func randomNumberInRange(lower: Int, upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func randomPresentationOfAdWithFrequency(oneIn: Int) {
        let randomNumber = randomNumberInRange(1, upper: oneIn)
        
        print("Random number: \(randomNumber)")
        
        if randomNumber == 1 {
            if interstitialAd != nil {
                if interstitialAd!.isReady {
                    interstitialAd?.presentFromRootViewController(self)
                    print("Ad presented")
                } else {
                    print("Ad was not ready for presentation")
                }
            }
        }
        
    }


}

