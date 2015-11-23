//
//  ViewController.swift
//  MPCRevisited
//
//  Created by Gabriel Theodoropoulos on 11/1/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MPCManagerDelegate {

    @IBOutlet weak var tblPeers: UITableView!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tblPeers.delegate = self
        tblPeers.dataSource = self
        
        appDelegate.mpcManager.delegate = self
        
        appDelegate.mpcManager.browser.startBrowsingForPeers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func foundPeer() {
        tblPeers.reloadData()
    }
    
    func lostPeer() {
        tblPeers.reloadData()
    }

    // MARK: IBAction method implementation
    
    @IBAction func startStopAdvertising(sender: AnyObject) {
        
    }
    
    
    // MARK: UITableView related method implementation
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.mpcManager.foundPeers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCellPeer")! as UITableViewCell
        
        cell.textLabel?.text = appDelegate.mpcManager.foundPeers[indexPath.row].displayName
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
}

