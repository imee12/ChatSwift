//
//  groupConversationViewController.swift
//  ChatAppSwift
//
//  Created by Imee Cuison on 6/22/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

import UIKit

var groupConversationVC_title = ""


class groupConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.title = groupConversationVC_title
    }
    
    
}
