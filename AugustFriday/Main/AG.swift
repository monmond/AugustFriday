//
//  AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 28/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import UIKit



//MARK: - AG
public class AG {

  public enum A { }
  public enum B { }
  public enum C { }
  public enum F { }
  public enum N { }
  
  public enum App { }
//  public enum Cover { }
//  public enum Google { }
  public enum Host { }
//  public enum Lorem { }
  public enum Scheme { }
//  public enum Smil { }
  public enum Bundle { }
  
  
  
  
  //MARK: - Configuration
  public class Configuration {
    public static let shared = Configuration()
    public var theme: AGColorTheme.Type = AG.C.Light.self
  }

}
