// Created by Mateus Lino

import SwiftUI

public class TextFieldComponent<ComponentView: TextFieldComponentViewProtocol>: DecodableBaseComponent<TextFieldComponent.Content, ComponentView> {
    public override func view(onAction: @escaping (Action) -> Void) -> ComponentView? {
        return ComponentView(content: content, identifier: identifier, onAction: onAction)
    }
}

extension TextFieldComponent {
    public final class Content: ComponentContent, Decodable {
        private enum CodingKeys: String, CodingKey {
            case placeholder
            case isSecure = "is_secure"
        }
        
        public let placeholder: String
        public let isSecure: Bool

        required public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            placeholder = try container.decode(String.self, forKey: .placeholder)
            isSecure = try container.decodeIfPresent(Bool.self, forKey: .isSecure) ?? false
        }
    }
}
