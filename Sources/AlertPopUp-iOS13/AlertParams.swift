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
    public let secondaryButtonAction: () -> Void
    //this will usually be "Cancel" and is ordered after the secondaryButtonAction so you don't get the syntax error with multiple trailing-closures
    public let secondaryButtonLabel: String
    //primary action at the end for trailing-closure goodness
    public let primaryButtonAction: () -> Void
    
    public init (title: String, message: String? = nil, showTwoButtons: Bool = false, primaryButtonLabel: String = "OK", destructive: Bool = false, secondaryButtonAction: @escaping () -> Void = {}, secondaryButtonLabel: String = "Cancel", primaryButtonAction: @escaping () -> Void = {}) {
        self.title = title
        self.message = message
        self.showTwoButtons = showTwoButtons
        self.primaryButtonLabel = primaryButtonLabel
        self.destructive = destructive
        self.secondaryButtonAction = secondaryButtonAction
        self.secondaryButtonLabel = secondaryButtonLabel
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
                    return Alert(
                        title: Text(alertParams.title),
                        message: alertParams.message != nil ? Text(alertParams.message!) : nil,
                        primaryButton: alertParams.destructive ? .destructive(Text(alertParams.primaryButtonLabel),
                                action: {
                                    alertParams.primaryButtonAction()
                                })
                        :
                            .default(Text(alertParams.primaryButtonLabel),
                                action: {
                                    alertParams.primaryButtonAction()
                                })
                        ,
                        secondaryButton: alertParams.secondaryButtonLabel == "Cancel" ? .cancel(Text("Cancel")) : .default(Text(alertParams.secondaryButtonLabel),
                        action: {
                            alertParams.secondaryButtonAction()
                        })
                    )
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

