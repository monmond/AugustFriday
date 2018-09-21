//
//  FirebaseVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Extensions
extension FirebaseVC: AGVCInstantiatable { }
extension FirebaseVC: UITableViewDelegate { }
extension FirebaseVC: UITableViewDataSource { }
extension FirebaseVC: AGHeaderHFVDelegate { }
extension FirebaseVC: FirebaseDetailViewDelegate { }



//MARK: - FirebaseVC
class FirebaseVC: AGVC, FirebaseViewConfigurationDependency {
  //MARK: - AGInstantiatable
  static var sb_name: String = "FirebaseView"
  static var vc_name: String = "FirebaseVC"
  
  
  
  //MARK: - UI
  @IBOutlet weak var table_fb: UITableView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var worker = FirebaseViewWorker()
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var vm_select: [Select] = {
    return Select.Action.allValues.map { Select(name: $0, detail: nil) }
  }()
  var vm_user: [UserAction] = UserAction.allValues
  var vm_pet: [PetAction] = PetAction.allValues
  var vm_userpet: [UserPetAction] = UserPetAction.allValues
  var vm_all: ViewModel = {
    return ViewModel(displayed: ViewModel.Action.allValues.map { ViewModel.ActionItem(name: $0, isCollpase: false) })
  }()
  
  
  struct ViewModel {
    
    enum Action: String, AGEnum {
      case selectAction
      case userAction
      case petAction
      case userPetAction
    }
    
    struct ActionItem {
      var name: Action
      var isCollpase: Bool
    }
    
    var displayed: [ActionItem]
    
  }
  
  
  struct Select {
    
    enum Action: String, AGEnum {
      case selectUser
      case selectPet
    }
    
    var name: Action
    var detail: String?
    
  }
  
  enum UserAction: String, AGEnum {
    case fetchUser
    case fetchUserById
    case insertUser
    case updateUser
    case deleteUser
  }
  
  enum PetAction: String, AGEnum {
    case fetchPet
    case fetchPetById
    case insertPet
    case updateUser
    case deletePet
  }
  
  enum UserPetAction: String, AGEnum {
    case fetchUserPet
    case insertUserPet
    case deleteUserPet
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
extension FirebaseVC {
  
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
extension FirebaseVC {
  
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
    
  }
  
  func setupUI() {
    title = FirebaseVC.vc_name
    table_fb.delegate = self
    table_fb.dataSource = self
    table_fb.registerHeaderFooterViewClass(AGHeaderHFV.self)
    
  }
  
  func setupSnp() {
    
  }
  
}



//MARK: - Setup Data
extension FirebaseVC {
  
  func setupDataOnViewDidLoad() {
    
  }
  
}



//MARK: - Event
extension FirebaseVC {
  
}



//MARK: - Public
extension FirebaseVC {
  
}



//MARK: - Private
extension FirebaseVC {
  
}



//MARK: - Interaction & Presentation
extension FirebaseVC {
  
  func fetchUserById() {
    guard let id = vm_select[0].detail else {
      displayFetchUserById(with: .dataNotValid)
      return 
    }
    worker.fetchUserById(id: id) { [weak self] in
      guard let _s = self else { return }
      switch $0.result { 
      case let .success(d):
        _s.displayFetchUserById(with: d)
        
      case let .failure(e):
        _s.displayFetchUserById(with: e)
        
      }
    }
    
  }
  
  func insertUser() {
    worker.insertUser { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayInsertUser(with: d)
        
      case let .failure(e):
        _s.displayInsertUser(with: e)
        
      }
    }
    
  }
  
  func updateUser() {
    worker.updateUser { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayUpdateUser(with: d)
        
      case let .failure(e):
        _s.displayUpdateUser(with: e)
        
      }
    }
    
  }
  
  func deleteUser() {
    guard let id = vm_select[0].detail else {
      displayDeleteUser(with: .dataNotValid)
      return
    }
    worker.deleteUser(id: id) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayDeleteUser(with: d)
        
      case let .failure(e):
        _s.displayDeleteUser(with: e)
        
      }
    }
  }
  
  func fetchPet() {
    worker.fetchPet { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayFetchPet(with: d)
        
      case let .failure(e):
        _s.displayFetchPet(with: e)
        
      }
    }
  }
  
  func fetchPetById() {
    guard let id = vm_select[1].detail else {
      displayFetchPetById(with: .dataNotValid)
      return
    }
    worker.fetchPetById(id: id) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayFetchPetById(with: d)
        
      case let .failure(e):
        _s.displayFetchPetById(with: e)
        
      }
    }
  }
  
  func insertPet() {
    worker.insertPet { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayInsertPet(with: d)
      case let .failure(e):
        _s.displayInsertPet(with: e)
      }
    }
  }
  
  func updatePet() {
    worker.updatePet { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayUpdateUser(with: d)
        
      case let .failure(e):
        _s.displayUpdateUser(with: e)
        
      }
    }
  }
  
  func deletePet() {
    guard let id = vm_select[1].detail else {
      displayDeletePet(with: .dataNotValid)
      return
    }
    worker.deletePet(id: id) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayDeletePet(with: d)
      case let .failure(e):
        _s.displayDeletePet(with: e)
      }
    }
  }
  
  func fetchUserPet() {
    guard let id = vm_select[0].detail else {
      displayFetchUserPet(with: .dataNotValid)
      return
    }
    worker.fetchUserPet(id: id) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayFetchUserPet(with: d)
      case let .failure(e):
        _s.displayFetchUserPet(with: e)
      }
    }
  }
  
  func insertUserPet() {
    guard let userId = vm_select[0].detail, let petId = vm_select[1].detail else {
      displayInsertUserPet(with: .dataNotValid)
      return
    }
    worker.insertUserPet(userId: userId, petId: petId) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayInsertUserPet(with: d)
      case let .failure(e):
        _s.displayInsertUserPet(with: e)
      }
    }
  }
  
  func deleteUserPet() {
    guard let userId = vm_select[0].detail, let petId = vm_select[1].detail else {
      displayDeleteUserPet(with: .dataNotValid)
      return
    }
    worker.deleteUserPet(userId: userId, petId: petId) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        _s.displayDeleteUserPet(with: d)
      case let .failure(e):
        _s.displayDeleteUserPet(with: e)
      }
    }
  }
  
}



//MARK: - Display
extension FirebaseVC {

  func displayFetchUserById(with response: User) {
    AGLog.info(response.description)
  }
  
  func displayFetchUserById(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayInsertUser(with response: String) {
    AGLog.info(response)
  }
  
  func displayInsertUser(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayUpdateUser(with response: String) {
    AGLog.info(response)
  }
  
  func displayUpdateUser(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayDeleteUser(with response: String) {
    AGLog.info(response)
  }
  
  func displayDeleteUser(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayFetchPet(with response: [Pet]) {
    for u in response {
      AGLog.info(u.description)
    }
  }
  
  func displayFetchPet(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayFetchPetById(with response: Pet) {
    AGLog.info(response.description)
  }
  
  func displayFetchPetById(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayInsertPet(with response: String) {
    AGLog.info(response)
  }
  
  func displayInsertPet(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayUpdatePet(with response: String) {
    AGLog.info(response)
  }
  
  func displayUpdatePet(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayDeletePet(with response: String) {
    AGLog.info(response)
  }
  
  func displayDeletePet(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayFetchUserPet(with response: User) {
    AGLog.info(response)
  }
  
  func displayFetchUserPet(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayInsertUserPet(with response: String) {
    AGLog.info(response)
  }
  
  func displayInsertUserPet(with error: AGError) {
    AGLog.info(error)
  }
  
  func displayDeleteUserPet(with response: String) {
    AGLog.info(response)
  }
  
  func displayDeleteUserPet(with error: AGError) {
    AGLog.info(error)
  }
  
}



//MARK: - Core - UITableViewDataSource
extension FirebaseVC {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return vm_all.displayed.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var row = 0
    guard !vm_all.displayed[section].isCollpase else { return row }
    switch vm_all.displayed[section].name {
    case .selectAction:
      row = vm_select.count
    case .userAction:
      row = vm_user.count
    case .petAction:
      row = vm_pet.count
    case .userPetAction:
      row = vm_userpet.count
    }
    return row
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableHeaderFooterView(AGHeaderHFV.self)
    let item = vm_all.displayed[section]
    cell.lb_title.text = item.name.rawValue.uppercased()
    cell.tag = section
    cell.delegate = self
    cell.setupData(with: item.isCollpase)
    return cell
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    let string_subtitle = "subtitle"
    switch vm_all.displayed[indexPath.section].name {
    case .selectAction:
      let action = vm_select[indexPath.row]
      cell.textLabel?.text = action.name.rawValue
      cell.detailTextLabel?.text = action.detail ?? string_subtitle
    case .userAction:
      let action = vm_user[indexPath.row]
      cell.textLabel?.text = action.rawValue
      cell.detailTextLabel?.text = string_subtitle
    case .petAction:
      let action = vm_pet[indexPath.row]
      cell.textLabel?.text = action.rawValue
      cell.detailTextLabel?.text = string_subtitle
    case .userPetAction:
      let action = vm_userpet[indexPath.row]
      cell.textLabel?.text = action.rawValue
      cell.detailTextLabel?.text = string_subtitle
    }
    return cell
  }
  
}



//MARK: - Core - UITableViewDelegate
extension FirebaseVC {
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return AGHeaderHFV.height
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return vm_all.displayed[indexPath.section].isCollpase ? 0 : UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch vm_all.displayed[indexPath.section].name {
    case .selectAction:
      let action = vm_select[indexPath.row]
      var pass_action: FirebaseDetailVC.Display.Action
      switch action.name {
      case .selectUser:
        pass_action = .user
      case .selectPet:
        pass_action = .pet
      }
      let vc = FirebaseDetailVC.vc
      vc.delegate = self
      vc.pass_action = pass_action
      navigationController?.pushViewController(vc, animated: true)
    case .userAction:
      let action = vm_user[indexPath.row]
      switch action {
      case .fetchUser:
        let vc = FirebaseDetailVC.vc
        vc.pass_action = .user
        navigationController?.pushViewController(vc, animated: true)
      case .fetchUserById:
        fetchUserById()
      case .insertUser:
        insertUser()
      case .updateUser:
        updateUser()
      case .deleteUser:
        deleteUser()
      }
    case .petAction:
      let action = vm_pet[indexPath.row]
      switch action {
      case .fetchPet:
        fetchPet()
      case .fetchPetById:
        fetchPetById()
      case .insertPet:
        insertPet()
      case .updateUser:
        break
      case .deletePet:
        deletePet()
      }
    case .userPetAction:
      let action = vm_userpet[indexPath.row]
      switch action {
      case .fetchUserPet:
        fetchUserPet()
      case .insertUserPet:
        insertUserPet()
      case .deleteUserPet:
        deleteUserPet()
      }
    }
   
    
  }
  
}



//MARK: - Custom - AGHeaderHFVDelegate
extension FirebaseVC {
  
  func agHeaderReusableDidSelect(section: Int) {
    AGLog.info(#function)
    vm_all.displayed[section].isCollpase = !vm_all.displayed[section].isCollpase
    table_fb.reloadSections(section.toIndexSet, with: .automatic)
    
  }
  
}



//MARK: - Custom - FirebaseDetailViewDelegate
extension FirebaseVC {
  
  func firebaseDetailViewTableDidSelect(item: String, action: FirebaseDetailVC.Display.Action) {
    AGLog.info(#function)
    navigationController?.popViewController(animated: true)
    switch action {
    case .user:
      vm_select[0].detail = item
    case .pet:
      vm_select[1].detail = item
    }
    table_fb.reloadSections(0.toIndexSet, with: .automatic)
  }
  
}



//MARK: - Pods - Protocol
extension FirebaseVC {
  
}




