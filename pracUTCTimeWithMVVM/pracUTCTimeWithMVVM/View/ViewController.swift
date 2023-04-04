//
//  ViewController.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var dateTimeLabel: UILabel!
	
	@IBAction func onYesterday(_ sender: UIButton) {
		
	}
	
	@IBAction func onNow(_ sender: UIButton) {
		
	}
	
	@IBAction func onTomorrow(_ sender: UIButton) {
	
	}
	
	let viewModel = ViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dateTimeLabel.text = viewModel.dateTimeString
	}
	
	


}

