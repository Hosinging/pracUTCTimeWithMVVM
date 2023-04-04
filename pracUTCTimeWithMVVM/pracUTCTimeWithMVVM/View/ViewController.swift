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
		viewModel.moveDay(day: -1)
	}
	
	@IBAction func onNow(_ sender: UIButton) {
		viewModel.reload()
	}
	
	@IBAction func onTomorrow(_ sender: UIButton) {
		viewModel.moveDay(day: 1)
	}
	
	let viewModel = ViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.onUpdated = { [weak self] in
			DispatchQueue.main.async {
				self?.dateTimeLabel.text = self?.viewModel.dateTimeString
			}
		}
		
		viewModel.viewDidLoad()
	}
	
	


}

