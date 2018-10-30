//
//  AGColor.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGColorTheme
protocol AGColorTheme {
  static var lb_1: UIColor { get }
  static var lb_2: UIColor { get }
  static var v_bg_1: UIColor { get }
  static var v_bg_2: UIColor { get }
  static var v_bg_3: UIColor { get }
  static var navigation: UIColor { get }
  static var progressBar_live: UIColor { get }
  static var progressBar_vod: UIColor { get }
  static var v_seperator: UIColor { get }
  static var cell_bg_default: UIColor { get }
  static var cell_bg_1: UIColor { get }
  static var cell_bg_2: UIColor { get }
  static var cell_bg_3: UIColor { get }
  static var cell_lb_1: UIColor { get }
  static var cell_lb_2: UIColor { get }
}



//MARK: - Color
public extension AG {
  
  public enum C {
    
    //MARK: AGColorTheme
    static let Theme: AGColorTheme.Type = AG.Configuration.shared.theme
    
    //MARK: Mono tone
    public static let clear = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
    public static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    public static let snow = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    public static let white_25 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2536922089)
    public static let cloud = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    public static let mercury = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    public static let magnesium = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    public static let concrete = #colorLiteral(red: 0.5843137255, green: 0.6470588235, blue: 0.6509803922, alpha: 1)
    public static let silver = #colorLiteral(red: 0.7411764706, green: 0.7647058824, blue: 0.7803921569, alpha: 1)
    public static let asbestos = #colorLiteral(red: 0.740403533, green: 0.7645514607, blue: 0.7811993361, alpha: 1)
    public static let gray = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    public static let grayLight = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    public static let wetAsphalt = #colorLiteral(red: 0.2039215686, green: 0.2862745098, blue: 0.368627451, alpha: 1)
    public static let midnightBlue = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1)
    public static let nickel = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
    public static let iron = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
    public static let tungsten = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    public static let lead = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    public static let licorice = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    public static let black = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    //MARK: Colors
    public static let sunFlower = #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
    public static let carrot = #colorLiteral(red: 0.9019607843, green: 0.4941176471, blue: 0.1333333333, alpha: 1)
    public static let flatOrange = #colorLiteral(red: 0.9529411765, green: 0.6117647059, blue: 0.07058823529, alpha: 1)
    public static let pumpkin = #colorLiteral(red: 0.8274509804, green: 0.3294117647, blue: 0, alpha: 1)
    public static let alizarin = #colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1)
    public static let pomegranate = #colorLiteral(red: 0.7529411765, green: 0.2235294118, blue: 0.168627451, alpha: 1)
    public static let red = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    public static let redDark = #colorLiteral(red: 0.6862745098, green: 0.1450980392, blue: 0.1803921569, alpha: 1)
    public static let green = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    public static let greenlight = #colorLiteral(red: 0.2176683843, green: 0.8194433451, blue: 0.2584097683, alpha: 1)
    public static let emerald = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.4431372549, alpha: 1)
    public static let nephritis = #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
    public static let purple = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    public static let amethyst = #colorLiteral(red: 0.6078431373, green: 0.3490196078, blue: 0.7137254902, alpha: 1)
    public static let wisteria = #colorLiteral(red: 0.5568627451, green: 0.2666666667, blue: 0.6784313725, alpha: 1)
    public static let mint = #colorLiteral(red: 0.3725490196, green: 0.8274509804, blue: 0.7843137255, alpha: 1)
    public static let greenSea = #colorLiteral(red: 0.0862745098, green: 0.6274509804, blue: 0.5215686275, alpha: 1)
    public static let turquoise = #colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1)
    public static let peterRiver = #colorLiteral(red: 0.2039215686, green: 0.5960784314, blue: 0.8588235294, alpha: 1)
    public static let belizeHole = #colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1)
    public static let blueberry = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    
    //MARK: Company
    public static let google = #colorLiteral(red: 0.8509803922, green: 0.3254901961, blue: 0.3098039216, alpha: 1)
    public static let facebook = #colorLiteral(red: 0.2666666667, green: 0.4117647059, blue: 0.6862745098, alpha: 1)
    
    //MARK: Log
    public static let danger = #colorLiteral(red: 0.8980392157, green: 0.2980392157, blue: 0.2588235294, alpha: 1)
    public static let info = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.8274509804, alpha: 1)
    public static let none = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
    public static let success = #colorLiteral(red: 0.2196078431, green: 0.8, blue: 0.4588235294, alpha: 1)
    public static let warning = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.1568627451, alpha: 1)
    
  }
  
}



//MARK: - Light
extension AG.C {
  
  enum Light: AGColorTheme {
    static let lb_1 = white
    static let lb_2 = silver
    static let v_bg_1 = iron
    static var v_bg_2 = black
    static var v_bg_3 = lead
    static let navigation = lead
    static var progressBar_live = blueberry
    static var progressBar_vod = red
    static var v_seperator = iron
    static var cell_bg_default = tungsten
    static var cell_bg_1 = black
    static var cell_bg_2 = lead
    static var cell_bg_3 = tungsten
    static var cell_lb_1 = grayLight
    static var cell_lb_2 = redDark
  }
  
}



//MARK: - Dark
extension AG.C {
  
  enum Dark: AGColorTheme {
    static let lb_1 = iron
    static let lb_2 = lead
    static let v_bg_1 = white
    static var v_bg_2 = black
    static var v_bg_3 = lead
    static let navigation = silver
    static var progressBar_live = blueberry
    static var progressBar_vod = red
    static var v_seperator = iron
    static var cell_bg_default = tungsten
    static var cell_bg_1 = black
    static var cell_bg_2 = lead
    static var cell_bg_3 = tungsten
    static var cell_lb_1 = grayLight
    static var cell_lb_2 = redDark
  }
  
}

