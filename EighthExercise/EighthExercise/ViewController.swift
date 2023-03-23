//
//  ViewController.swift
//  EighthExercise
//
//  Created by Лада Зудова on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        view.contentMode = .scaleAspectFit
        view.showsVerticalScrollIndicator = true
        view.contentSize = CGSize(width: view.frame.width, height: 2000)
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(systemName: "person.crop.circle.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureNavigation()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            print(stringFromClass)
            if stringFromClass.contains("UINavigationBarLargeTitleView") {
                subview.addSubview(imageView)
            }
        }
    
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            print(stringFromClass)
            if stringFromClass.contains("UINavigationBarLargeTitleView") {
                subview.addSubview(imageView)
            }
        }
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: -10),
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -30),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func configureNavigation() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemPink
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBrown
        appearance.backgroundImageContentMode = .bottomRight
        navigationItem.standardAppearance = coloredAppearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
