//
//  ViewController.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//

import UIKit

class WidgetAppVC: UIViewController {
    
    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let naContainerV = UIView()
    private let titleLbl = UILabel()
    private let imagePickerButton = UIButton()
    private var imagePickerHelper: ImagePickerHelper?
    private var imageList: [UIImage?] = [UIImage(named: "img1"), UIImage(named: "img2"), UIImage(named: "img3") ,UIImage(named: "img4"),
                                        UIImage(named: "img5"), UIImage(named: "img6")]
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = defaultColor
        setupNavi()
        setupCV()
    }
}

extension WidgetAppVC {
    
    func setupNavi() {
        navigationItem.setHidesBackButton(true, animated: false)
        naContainerV.configureContainerView(navigationItem)
        
        let title = NSLocalizedString("My Widget App", comment: "WidgetAppVC.swift: My Widget App")
        titleLbl.configureTitleForNavi(naContainerV, isTxt: title)
        
        //TODO - Bag
        imagePickerButton.configurePickerButton(naContainerV, selector: #selector(selectWidgetPhoto), controller: self)
    }
    
    @objc
    func selectWidgetPhoto() {
        imagePickerHelper = ImagePickerHelper(vc: self, completion: { (image) in
            guard let image = image else { return }
            self.imageList.append(image)
            self.saveImageInCoreData(image)
            self.collectionView.reloadData()
        })
    }
    
    func saveImageInCoreData(_ image: UIImage) {
       
        self.showCheckMark()
    }

    func setupCV() {
        collectionView.configureCVAddSub(ds: self, dl: self, view: view)
        collectionView.register(WidgetAppCell.self, forCellWithReuseIdentifier: WidgetAppCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func showCheckMark() {
        let cTxt = NSLocalizedString("Success", comment: "WidgetAppVC.swift: Success")
        handleSuccessAlert(cTxt, imgName: "icon-checkmark")
    }
}

//MARK: - UICollectionViewDataSource

extension WidgetAppVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WidgetAppCell.identifier, for: indexPath) as! WidgetAppCell
        cell.nameLbl.text = "By:- CodewithArvind Pune Maharashtra, India"
        cell.imgView.image = imageList[indexPath.row]
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension WidgetAppVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeItem = (collectionView.frame.size.width - 40.0)/2.0
        return CGSize(width: sizeItem, height: (sizeItem*1.4)+(sizeItem*0.40))
    }
}

//MARK: - UICollectionViewDelegate

extension WidgetAppVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.saveImageInCoreData(imageList[indexPath.row]!)
    }
}
