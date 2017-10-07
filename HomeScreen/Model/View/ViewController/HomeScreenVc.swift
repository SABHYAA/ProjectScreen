//
//  HomeScreenVc.swift
//  HomeScreen
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class HomeScreenVc: UIViewController {
    // MARK: Outlet
    @IBOutlet weak var homescreenTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homescreenTableView.dataSource = self
        self.homescreenTableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
// MARK: Tableview Datasource And Delegates

extension HomeScreenVc: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellid", for: indexPath) as! CustomCell

            
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCellId", for: indexPath) as! GeneralCell
            
            
            return cell
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CorporatecellId", for: indexPath) as! Corporatecell
            
            return cell
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingCell", for: indexPath) as! TrendingCell
            return cell
            
            
        default:
            fatalError("wrong indexpath")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 300
        }else if indexPath.row == 3{
            return 180
        }else{
            return 120
        }
    }
    
    
}

// MARK: Custom Classes
class CustomCell: UITableViewCell{
    @IBOutlet weak var headerbackgroundImg: UIImageView!
    @IBOutlet weak var homesidemenuBtn: UIButton!
    @IBOutlet weak var homebuyingBtn: UIButton!
    @IBOutlet weak var whatareyoulookingforLabel: UILabel!
}
class GeneralCell: UITableViewCell {
    
    var serviceImage = ["icHomeInsurance", "icHomeRealEstate", "icHomeCredit", "icHomeDth"]
    var serviceName = [" Insurance", "Real State", "Credit / Debit card", "postpaid Dth Service"]
    
    @IBOutlet weak var generalcellCollectionView: UICollectionView!
    override func awakeFromNib() {
        self.generalcellCollectionView.dataSource = self
        self.generalcellCollectionView.delegate = self
    }
}
class Corporatecell: UITableViewCell{
    
    @IBOutlet weak var corporateCollectionView: UICollectionView!
    
    var corporateImage = ["icHomeLoan", "icHomeHrRecruitment", "icHomeHrConsultancy"]
    var corporateName = ["SME Loan", " HR Recruitment", "HR Consultancy"]
    
    override func awakeFromNib() {
        self.corporateCollectionView.dataSource = self
        self.corporateCollectionView.delegate = self
    }
    
}
// MARK: UICollectionview DataSource And Delegates
extension Corporatecell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return corporateName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CorporateCell2Id", for: indexPath) as! CorporateCell2
        
        cell.corporateImgView.image = UIImage(named: corporateImage[indexPath.row])
        cell.corporatenameLbl.text = corporateName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 75, height: 120)
    }
}

extension GeneralCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return serviceName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        cell.generalImageView.image = UIImage(named: serviceImage[indexPath.row])
        cell.imagenameLbl.text = serviceName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width / 4 - 10
        
        return CGSize(width: width, height: 120)
    }
    
}


class TrendingCell: UITableViewCell {
    @IBOutlet weak var trendingcollectionView: UICollectionView!
    @IBOutlet weak var trendingcityLbl: UILabel!
    
    var trendingImage = ["Grand Hyatt", "Burj Khalifa", "Jaipur Place-2"]
    var trendingName = ["Grand Hyatt", "Burj Khalifa", "Jaipur Place-2"]
    
    override func awakeFromNib() {
        self.trendingcollectionView.dataSource = self
        self.trendingcollectionView.delegate = self
    }
    
}
extension TrendingCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell2", for: indexPath) as! TrendingCell2
        cell.trendingImageView.image = UIImage(named: trendingImage[indexPath.row])
        cell.trendingLbl.text = trendingName[indexPath.row]
        return cell
    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 250, height: 150)
   }
}
// MARK: UICollectionViewCell Class
class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var generalImageView: UIImageView!
    @IBOutlet weak var imagenameLbl: UILabel!
    
}
class CorporateCell2: UICollectionViewCell {
    
    @IBOutlet weak var corporateImgView: UIImageView!
    @IBOutlet weak var corporatenameLbl: UILabel!
}
class TrendingCell2: UICollectionViewCell {
    
    @IBOutlet weak var trendingImageView: UIImageView!
    @IBOutlet weak var trendingLbl: UILabel!
    
}

