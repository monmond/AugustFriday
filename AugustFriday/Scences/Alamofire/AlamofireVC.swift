//
//  AlamofireVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Extensions
extension AlamofireVC: AGVCInstantiatable { }
extension AlamofireVC: UITableViewDelegate { }
extension AlamofireVC: UITableViewDataSource { }



//MARK: - AlamofireVC
class AlamofireVC: AGVC {
  //MARK: - AGInstantiatable
  static var sb_name: String = "Alamofire"
  static var vc_name: String = "AlamofireVC"
  
  
  
  //MARK: - UI
  var btn_cancle: UIBarButtonItem!
  @IBOutlet weak var table_af: UITableView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var bm_actions: [AlamofireAction] = AlamofireAction.allCases
  
  enum AlamofireAction: String, CaseIterable {
    case fetchTest
    case b
  }
  
  
  
  //MARK: - Initial
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
    
  }
  
}



//MARK: - Life cycle
extension AlamofireVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  func onInit() {
    
  }
  
  func onDeinit() {
    
  }
  
}



//MARK: - Setup View
extension AlamofireVC {
  
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
    
  }
  
  func setupUI() {
    title = AlamofireVC.vc_name
    btn_cancle = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancleBBIPressed))
    navigationItem.rightBarButtonItems = [btn_cancle]
    table_af.delegate = self
    table_af.dataSource = self
    
  }
  
  func setupSnp() {
    
  }
  
}



//MARK: - Setup Data
extension AlamofireVC {
  
  func setupDataOnViewDidLoad() {
    fetchTest()
  }
  
}



//MARK: - Event
extension AlamofireVC {

  @objc
  func cancleBBIPressed() {

  }
  
}



//MARK: - Public
extension AlamofireVC {
  
}



//MARK: - Private
extension AlamofireVC {
  
}



//MARK: - Interaction & Presentation
extension AlamofireVC {
  
  func fetchTest() {
    let param = GetAvatar.Request()
    AvatarApi.getAvatar(param) {
      switch $0.result {
      case let .success(d):
        AGLog.info("success \(d)")
      case let .failure(e):
        AGLog.info("failure \(e)")
      }
    }
    
  }
  
}



//MARK: - Display
extension AlamofireVC {
  
}



//MARK: - Core - UITableViewDataSource
extension AlamofireVC {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bm_actions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let action = bm_actions[indexPath.row]
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = action.rawValue
    cell.detailTextLabel?.text = "subtitle"
    return cell
  }
  
}



//MARK: - Core - UITableViewDelegate
extension AlamofireVC {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let action = bm_actions[indexPath.row]
    switch action {
    case .fetchTest:
      fetchTest()
      
    case .b:
      break
      
    }
    
  }
  
}



//MARK: - Custom - Protocol
extension AlamofireVC {
  
}



//MARK: - Pods - Protocol
extension AlamofireVC {
  
}




