// Created by Mateus Lino

import Combine
import SwiftUI

public protocol ComponentView {
    func asSwiftUIView() -> AnyView?
    func asUIKitView() -> UIView?
}

public extension ComponentView {
    func asSwiftUIView() -> AnyView? {
        guard let view = self as? any View else {
            return nil
        }

        return AnyView(view)
    }

    func asUIKitView() -> UIView? {
        return self as? UIView
    }
}