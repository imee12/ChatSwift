//
//  groupViewController.swift
//  ChatAppSwift
//
//  Created by Imee Cuison on 6/22/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

import UIKit

class groupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var resultsTable: UITableView!
    
    
    var resultsNameArray = Set([""])
    var resultsNameArray2 = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var theWidth = view.frame.size.width
        var theHeight = view.frame.size.height
        
        resultsTable.frame = CGRectMake(0, 0, theWidth, theHeight - 64)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
       // groupConversationVC_title = ""
        
        self.resultsNameArray.removeAll(keepCapacity: false)
        self.resultsNameArray2.removeAll(keepCapacity: false)
        
        var query = PFQuery(className: "GroupMessages")
        query.addAscendingOrder("group")
        
        query.findObjectsInBackgroundWithBlock {
            (objects:[AnyObject]?, error:NSError?) -> Void in
            
            if error == nil {
                
                for object in objects! {
                    
                    self.resultsNameArray.insert(object.objectForKey("group") as! String)
                    self.resultsNameArray2 = Array(self.resultsNameArray)
                    
                    self.resultsTable.reloadData()
                    
                }
                
                
            }
        }

    
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultsNameArray2.count
            }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:groupCell = tableView.dequeueReusableCellWithIdentifier("groupCell") as! groupCell
        
        cell.groupNameLbl.text = resultsNameArray2[indexPath.row]
        
        
        return cell
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 40
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! groupCell
        
       groupConversationVC_title = resultsNameArray2[indexPath.row]
        
       self.performSegueWithIdentifier("goToGroupConversationVC_fromGroupVC", sender: self)
        
    }

    
    @IBAction func addGroupBtn_click(sender: AnyObject) {
        
        var alert = UIAlertController(title: "New Group", message: "Type the name of the group", preferredStyle: UIAlertControllerStyle.Alert)

        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            (action) -> Void in
            
            println("ok pressed")
            
            let textF = alert.textFields![0] as! UITextField
            
            var groupMessageObj = PFObject(className: "GroupMessages")
            
            let theUser:String = PFUser.currentUser()!.username!
            
            groupMessageObj["sender"] = theUser
            groupMessageObj["message"] = "\(theUser) created a new Group"
            groupMessageObj["group"] = textF.text
            
            groupMessageObj.save()
            
            println("group created")
            
            groupConversationVC_title = textF.text
            
            self.performSegueWithIdentifier("goToGroupConversationVC_fromGroupVC", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) -> Void in
            
            
        }))

        
         self.presentViewController(alert, animated: true, completion: nil)
        
    }
   
}
