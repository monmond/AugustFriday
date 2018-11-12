//
//  FirebaseDetailVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 16/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

//MARK: - Imports
import UIKit



//MARK: - FirebaseDetailViewDelegate
protocol FirebaseDetailViewDelegate: class {
  func firebaseDetailViewTableDidSelect(item: String, action: FirebaseDetailVC.Display.Action)
}



//MARK: - Extensions
extension FirebaseDetailVC: AGVCInstantiatable { }
extension FirebaseDetailVC: UITableViewDelegate { }
extension FirebaseDetailVC: UITableViewDataSource { }



//MARK: - FirebaseDetailVC
class FirebaseDetailVC: UIViewController {
  //MARK: - AGInstantiatable
  static var sb_name: String = "FirebaseDetailView"
  static var vc_name: String = "FirebaseDetailVC"
  
  
  
  //MARK: - UI
  @IBOutlet weak var table_fb: UITableView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var worker = FirebaseViewWorker()
  weak var delegate: FirebaseDetailViewDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var pass_action: FirebaseDetailVC.Display.Action = .user
  var vm_detail = ViewModel(displayed: [])
  
  struct ViewModel {
    struct Item {
      var id: String
      var name: String
    }
    var displayed: [Item]
  }
  
  struct Display {
    enum Action: String, CaseIterable {
      case user
      case pet
    }
  }
  
  
  //MARK: - Initial
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
    
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
extension FirebaseDetailVC {
  
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
extension FirebaseDetailVC {
  
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
    
  }
  
  func setupUI() {
    title = "\(FirebaseDetailVC.vc_name) \(pass_action.rawValue)"
    table_fb.delegate = self
    table_fb.dataSource = self
    
  }
  
  func setupSnp() {
    
  }
  
}



//MARK: - Setup Data
extension FirebaseDetailVC {
  
  func setupDataOnViewDidLoad() {
    switch pass_action {
    case .user:
      fetchUser()
    case .pet:
      fetchPet()
    }
  }
  
}



//MARK: - Event
extension FirebaseDetailVC {
  
}



//MARK: - Public
extension FirebaseDetailVC {
  
}



//MARK: - Private
extension FirebaseDetailVC {
  
}



//MARK: - Interaction & Presentation
extension FirebaseDetailVC {
  
  func fetchUser() {
    worker.fetchUser() { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayFetchUser(with: d)
      case let .failure(e):
        _s.displayFetchUser(with: e)
      }
    }
  }
  
  func fetchPet() {
    worker.fetchPet() { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayFetchPet(with: d)
      case let .failure(e):
        _s.displayFetchPet(with: e)
      }
    }
  }
  
}



//MARK: - Display
extension FirebaseDetailVC {
  
  func displayFetchUser(with response: [User]) {
    let list = response.map { ViewModel.Item(id: $0.id, name: $0.name) }
    let vm = ViewModel(displayed: list)
    vm_detail = vm
    table_fb.reloadData()
  }
  
  func displayFetchUser(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayFetchPet(with response: [Pet]) {
    let list = response.map { ViewModel.Item(id: $0.id, name: $0.name) }
    let vm = ViewModel(displayed: list)
    vm_detail = vm
    table_fb.reloadData()
  }
  
  func displayFetchPet(with error: AGError) {
    AGLog.info(error)
  }
  
}



//MARK: - Core - Protocol
extension FirebaseDetailVC {
  
}



//MARK: - Custom - Protocol
extension FirebaseDetailVC {
  
}



//MARK: - Pods - Protocol
extension FirebaseDetailVC {
  
}



//MARK: - Core - UITableViewDataSource
extension FirebaseDetailVC {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vm_detail.displayed.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    let item = vm_detail.displayed[indexPath.row]
    cell.textLabel?.text = item.id
    cell.detailTextLabel?.text = item.name
    return cell
  }
  
}



//MARK: - Core - UITableViewDelegate
extension FirebaseDetailVC {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = vm_detail.displayed[indexPath.row]
    delegate?.firebaseDetailViewTableDidSelect(item: item.id, action: pass_action)
  }
  
}



