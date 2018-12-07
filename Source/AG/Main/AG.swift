//
//  AG.Cons.swift
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

  public class Cons {
    public class Asset { }
    public class Button { }
    public class Color { }
    public class Font { }
    public class Notification { }
    
    public class App { }
    //  public class Cover { }
    //  public class Google { }
    public class Host { }
    //  public class Lorem { }
    public class Scheme { }
    //  public class Smil { }
    public class Bundle { }
  }
  public class Util {
    open class TextField: AGUtilTextField { }
    open class Validator: AGUtilValidator { }
    open class Formatter: AGUtilFormatter { }
  }
  
}


public extension AG.Cons {
  
 
  
  //MARK: - Configuration
  public class Configuration {
    public static let shared = Configuration()
    public var theme: AGColorTheme.Type = AG.Cons.Color.Light.self
  }

}
