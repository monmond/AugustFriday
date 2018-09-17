//
//  MainVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - Extensions
extension MainVC: AGVCInstantiatable { }
extension MainVC: UITableViewDelegate { }
extension MainVC: UITableViewDataSource { }



//MARK: - MainVC
class MainVC: AGVC {
  //MARK: - AGInstantiatable
  static var sb_name: String = "Main"
  static var vc_name: String = "MainVC"
  
  
  //MARK: - UI  
  @IBOutlet weak var table_vc: UITableView!

  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  let bm_vcs: [UIViewController.Type] = [
    AlamofireVC.self,
    FirebaseVC.self
  ]
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
    
  }
  
}



//MARK: - Life cycle
extension MainVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  fileprivate func onInit() {
    
  }
  
  fileprivate func onDeinit() {
    
  }
  
}



//MARK: - Setup View
extension MainVC {
  
  fileprivate func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
    
  }
  
  fileprivate func setupUI() {
    title = MainVC.vc_name
    table_vc.delegate = self
    table_vc.dataSource = self
    
  }
  
  fileprivate func setupSnp() {
    
  }
  
}



//MARK: - Setup Data
extension MainVC {
  
  fileprivate func setupDataOnViewDidLoad() {
    
  }
  
}



//MARK: - Event
extension MainVC {
  
}



//MARK: - Public
extension MainVC {
  
}



//MARK: - Private
extension MainVC {
  
}



//MARK: - Interaction & Presentation
extension MainVC {
  
}



//MARK: - Display
extension MainVC {
  
}



//MARK: - Core - UITableViewDataSource
extension MainVC {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bm_vcs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let vc = bm_vcs[indexPath.row] as? AGVCInstantiatable.Type else {
      return UITableViewCell()
    }
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = vc.vc_name
    cell.detailTextLabel?.text = "subtitle"
    return cell
  }
  
}



//MARK: - Core - UITableViewDelegate
extension MainVC {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = bm_vcs[indexPath.row]
    switch vc {
    case let vc as AlamofireVC.Type:
      navigationController?.pushViewController(vc.vc, animated: true)
    case let vc as FirebaseVC.Type:
      navigationController?.pushViewController(vc.vc, animated: true)
    default:
      break
    }
    
  }
  
}



//MARK: - Custom - Protocol
extension MainVC {
  
}



//MARK: - Pods - Protocol
extension MainVC {
  
}



