//
//  AlertParams.swift
//  AlertPopups
//
//  Created by Doug Marttila on 12/2/21.
//  You could make the destructive params optionals instead of passing in default values. I still go back and forth on which approach is better.

import SwiftUI

public struct AlertParams: Identifiable {
    public let id: UUID = UUID()
    public let title: String
    public let message: String?
    public let showTwoButtons: Bool
    public let primaryButtonLabel: String
    //if desctructive, the action button is displayed in red
    public let destructive: Bool
    public let primaryButtonAction: () -> Void
    
    public init (title: String, message: String?, showTwoButtons: Bool = false, primaryButtonLabel: String = "OK", destructive: Bool = false, primaryButtonAction: @escaping () -> Void = {}) {
        self.title = title
        self.message = message
        self.showTwoButtons = showTwoButtons
        self.primaryButtonLabel = primaryButtonLabel
        self.destructive = destructive
        self.primaryButtonAction = primaryButtonAction
    }
}

//Because it's in a Package, the struct needs to be declared public, and you need a public init method
public struct AlertModifier: ViewModifier {
    public init (alertParams: Binding<AlertParams?>) {
        self._alertParams = alertParams
    }
    @Binding public var alertParams: AlertParams?
    public func body(content: Content) -> some View {
        content
            .alert(item: $alertParams, content: { alertParams in
                if alertParams.showTwoButtons {
                    if alertParams.destructive {
                        return Alert(
                            title: Text(alertParams.title),
                            message: alertParams.message != nil ? Text(alertParams.message!) : nil,
                            primaryButton: .destructive(Text(alertParams.primaryButtonLabel),
                                action: {
                                    alertParams.primaryButtonAction()
                                })
                            ,
                            secondaryButton: .cancel(Text("Cancel"))
                        )
                    } else {
                        //the only difference between this and the above Alert is .default instead of .desctructive for the primary button label. I can't figure out a way to change that programmatically
                        return Alert(
                            title: Text(alertParams.title),
                            message: alertParams.message != nil ? Text(alertParams.message!) : nil,
                            primaryButton:
                                    .default(Text(alertParams.primaryButtonLabel),
                                    action: {
                                        alertParams.primaryButtonAction()
                                    })
                            ,
                            secondaryButton: .cancel(Text("Cancel"))
                        )
                    }
                } else {
                    return Alert(
                        title: Text(alertParams.title),
                        message: alertParams.message != nil ? Text(alertParams.message!) : nil,
                        dismissButton: .default(Text(alertParams.primaryButtonLabel),
                            action: {
                                alertParams.primaryButtonAction()
                            })
                    )
                }
            })
    }
}

