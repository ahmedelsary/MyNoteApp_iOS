//
//  NoteViewController.swift
//  NewNoteApp
//
//  Created by vm mac on 17/03/2018.
//  Copyright © 2018 vm mac. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    var editNote:Note?

    @IBOutlet weak var txtTitle: UITextField!

    @IBOutlet weak var tvDetails: UITextView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let note = editNote{
            txtTitle.text = note.title
            tvDetails.text=note.details
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func btnSave(_ sender: Any) {
       
        var newNote:Note?
        
        if(txtTitle.text != "" && tvDetails.text != ""){
            
            
            if let note = editNote {
              newNote = note
            }
            else{
                newNote = Note(context: context)
            }
            newNote?.title = txtTitle.text
            newNote?.details = tvDetails.text
            newNote?.date_save = NSDate()
            
            ad.saveContext()
            txtTitle.text=""
            tvDetails.text=""
            print("saved")
            
        }else{
            print("fill input")
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
