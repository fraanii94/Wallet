//
//  WalletTableViewController.swift
//  Wallet
//
//  Created by fran on 24/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import UIKit

class WalletTableViewController: UITableViewController {
    
    var model : Wallet
    var broker : Broker
    
    init(){
        self.model = Wallet(amount: 0, currency: .EUR)
        self.broker = Broker()
        super.init(style: .Plain)
       

    }
    
    init(model m: Wallet,broker b : Broker){
        
        self.model = m
        self.broker = b
        
        super.init(style: .Plain)
        self.title = "Wallet"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.model.moneys.keys.count + 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == self.model.moneys.keys.count){
            return 1
        }else{
            return self.model.numberOfMoneysAt(index: section) + 1
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == model.moneys.keys.count){
            return "TOTAL (EUR)"
        }else{
            return self.model.currencies[section].description()
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID")
        
        if(cell == nil){
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        
        if(indexPath.section == self.model.currencies.count){
            
            do {
                cell?.textLabel?.text = try self.broker.reduce(money: model, toCurrency: .EUR).amount.description
                
            }catch{
                print("se lio")
            }
            
        }else{
            let currency = self.model.currencyAt(index: indexPath.section)
            
            if(indexPath.row == self.model.moneys[currency]!.count){
                var subtotal : Double = 0
                for money in self.model.moneys[currency]!{
                    do{
                        let amount = try self.broker.reduce(money: money, toCurrency: currency).amount
                        subtotal = subtotal + amount
                    }catch{
                        print("se lio")
                    }
                }
                
                cell?.textLabel?.text = "Subtotal: \(subtotal)"
            }else{
                cell?.textLabel?.text = "\(model.moneys[currency]![indexPath.row].amount.description)"
            }
            
            
            

            
        }
        
        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
