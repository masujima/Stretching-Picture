//
//  ViewController.swift
//  StretchingPicture
//
//  Created by Yernar Masujima on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.backgroundColor = .systemGray3
		scrollView.contentInsetAdjustmentBehavior = .never
		scrollView.delegate = self
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		
		return scrollView
	}()
	
	private lazy var imageContainerView: UIView = {
		let view = UIView()
		view.backgroundColor = .darkGray
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .systemPink
		imageView.contentMode = .scaleAspectFill
		imageView.image = UIImage(named: "crying-cat")
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		return imageView
	}()
	
	private let someView: UIView = {
		let view = UIView()
		view.backgroundColor = .systemTeal
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		configureScrollView()
		configureImageContainerView()
		configureImageView()
		configureSomeView()
	}
	
	private func configureScrollView() {
		view.addSubview(scrollView)
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	private func configureImageContainerView() {
		scrollView.addSubview(imageContainerView)
		NSLayoutConstraint.activate([
			imageContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			imageContainerView.heightAnchor.constraint(equalToConstant: 270)
		])
	}
	
	private func configureImageView() {
		scrollView.addSubview(imageView)
		
		let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
		imageViewTopConstraint.priority = .defaultHigh
		imageViewTopConstraint.isActive = true
		
		let imageViewHeightConstraint = imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: imageContainerView.frame.height)
		imageViewHeightConstraint.priority = .required
		imageViewHeightConstraint.isActive = true
		
		NSLayoutConstraint.activate([
			imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor)
		])
	}
	
	private func configureSomeView() {
		scrollView.addSubview(someView)
		NSLayoutConstraint.activate([
			someView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
			someView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			someView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			someView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			someView.heightAnchor.constraint(equalToConstant: 2000)
		])
	}
}

extension ViewController: UIScrollViewDelegate {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		scrollView.scrollIndicatorInsets = UIEdgeInsets(top: imageView.frame.size.height - 59, left: 0, bottom: 0, right: 0)
	}
}
