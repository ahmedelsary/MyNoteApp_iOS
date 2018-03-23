//
//  NoteTableViewCell.swift
//  NewNoteApp
//
//  Created by vm mac on 17/03/2018.
//  Copyright © 2018 vm mac. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tvDetails: UITextView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setNote(note:Note) {
        lblTitle.text=note.title
        tvDetails.text=note.details
        let dateFormat=DateFormatter()
        dateFormat.dateFormat="MM/dd/yy h:mm a"
        let now = dateFormat.string(from: note.date_save as! Date)
        lblDate.text = now
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
