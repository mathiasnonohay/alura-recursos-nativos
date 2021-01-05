//
//  Mensagem.swift
//  Agenda
//
//  Created by Mathias Almeida Nonohay on 1/5/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMessageComposeViewControllerDelegate {

    // MARK: - Metodos
    
    func configuraSMS(_ aluno:Aluno) -> MFMessageComposeViewController? {
        if MFMessageComposeViewController.canSendText() {
            let componentMensagem = MFMessageComposeViewController()
            guard let numeroDoAluno = aluno.telefone else { return componentMensagem }
            componentMensagem.recipients = [numeroDoAluno]
            componentMensagem.messageComposeDelegate = self
            
            return componentMensagem
        }
        return nil
    }
    
    // MARK: - MessageComposeDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
