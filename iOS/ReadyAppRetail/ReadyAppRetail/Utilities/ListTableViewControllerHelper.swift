/*
Licensed Materials - Property of IBM
© Copyright IBM Corporation 2015. All Rights Reserved.
*/

import UIKit
import Realm

class ListTableViewControllerHelper: NSObject {
   
    
    /**
    This method registers the tableView parameter with the ListCell and SpaceCell Nib files
    
    - parameter tableView:
    */
    class func registerNibFile(tableView : UITableView){
        let nib : UINib = UINib(nibName: "ListTableViewCell", bundle:nil)
        
        //register the tableView with this nib file
        tableView.registerNib(nib, forCellReuseIdentifier: "ListCell")
        
        let nib2 : UINib = UINib(nibName: "BlankTableViewCell", bundle: nil)
        
        tableView.registerNib(nib2, forCellReuseIdentifier: "SpaceCell")
    }
    
    
    /**
    This method registers the tableView parameter with the SpaceCell Nib file
    
    - parameter tableView: 
    */
    class func registerSpaceCellNibFile(tableView : UITableView){
        
        let nib : UINib = UINib(nibName: "BlankTableViewCell", bundle: nil)
        
        //register the tableView with this nib file
        tableView.registerNib(nib, forCellReuseIdentifier: "SpaceCell")

    }
    
    /**
    This method creates the attributed string for the label of the list name
    
    - parameter listName:
    - parameter listItemCount:
    
    - returns:
    */
    class func createListAttributedString(listName : NSString, listItemCount : Int) -> NSAttributedString {
        
        let string : NSString = "\(listName) (\(listItemCount))"
        // let string = localizedString as NSString
        let attributedString = NSMutableAttributedString(string: string as String)
        
        //Add attributes to two parts of the string
        attributedString.addAttributes([NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 16)!,  NSForegroundColorAttributeName: UIColor.blackColor()], range: string.rangeOfString("\(listName) "))
        attributedString.addAttributes([NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!,  NSForegroundColorAttributeName: UIColor.blackColor()], range: string.rangeOfString("(\(listItemCount))"))
        
        return attributedString
    }
    
    
    /**
    This method creates a list cell for the cellForRowAtIdexPath method
    
    - parameter list:
    - parameter tableView:
    - parameter indexPath:
    
    - returns:
    */
    class func createListCell(list : List, tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as! ListTableViewCell
        cell.listName.attributedText = self.createListAttributedString(list.name, listItemCount: Int(list.products.count))
        
        let url = NSURL(string: RealmHelper.getListPhoto(list) as String)
        cell.listImage.sd_setImageWithURL(url, placeholderImage: UIImage(named: "Product_PlaceHolder"))
        
        return cell
    }
    
    /**
    This method creates a space cell for the cellForRowAtIndexPath
    
    - parameter tableView:
    - parameter indexPath:
    
    - returns:
    */
    class func createSpaceCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SpaceCell", forIndexPath: indexPath) as! BlankTableViewCell
        cell.userInteractionEnabled = false
        return cell
    }
    
    
    /**
    This method creates a "createNewListCell" for the cellForRowAtIndexPath
    
    - parameter tableView:
    - parameter indexPath:
    
    - returns:
    */
    class func createCreateNewListCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("createNewListCell", forIndexPath: indexPath) as! CreateNewListTableViewCell
        return cell
    }
    
    
    
    
}
