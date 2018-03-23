//
//  ViewController.swift
//  NewNoteApp
//
//  Created by vm mac on 17/03/2018.
//  Copyright © 2018 vm mac. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var notes=[Note]()
    @IBOutlet weak var tvListNote: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnAdd(_ sender: Any) {
        performSegue(withIdentifier: "AddOrEditSegue", sender: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.setNote(note: notes[indexPath.row])
        
        cell.btnDelete.tag=indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(btnPressDelete(_:)), for: .touchUpInside)
        
        
        cell.btnEdit.tag=indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(btnPressEdit(_:)), for: .touchUpInside)
        
        
        return cell
    }
    @objc func btnPressDelete(_ sender:UIButton){
        let alert = UIAlertController(title: "Alert", message: "Did you want to delete "+notes[sender.tag].title!+" ?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                print("index \(sender.tag)")
                context.delete(self.notes[sender.tag])
                ad.saveContext()
                self.loadNotes()
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default, handler:nil))
        
        
        self.present(alert, animated: true, completion: nil)
       
        
    }
    @objc func btnPressEdit(_ sender:UIButton){
         performSegue(withIdentifier: "AddOrEditSegue", sender: notes[sender.tag])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddOrEditSegue" {
            if let AddOREdit = segue.destination as? NoteViewController {
                if let mynote = sender as? Note {
                    AddOREdit.editNote = mynote
                }
            }
        }
        dismiss(animated: true, completion: nil)
        

    }

    func loadNotes(){
        let fetchRequest:NSFetchRequest<Note> = Note.fetchRequest()
        do{
            notes = try context.fetch(fetchRequest)
            tvListNote.reloadData()
        }catch{
            print("Error in load Notes.")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        loadNotes()

    }
  
    
    
    
    
    
    
}

