import SwiftUI
import VBWDCore

// MARK: - Plugin Entry Point

/// Invoice payment plugin. Registers a `CheckoutInvoiceInfo` component that
/// appears in the checkout flow when the "invoice" payment method is selected.
///
/// Mirrors the web invoice payment behaviour: when the user selects "Invoice"
/// as payment method, the backend creates an invoice via `POST /user/checkout`
/// and the user receives it by email. No external redirect is needed — this
/// is the simplest payment method.
///
/// The plugin is intentionally thin because all invoice creation logic lives
/// in the backend.
public final class InvoicePaymentPlugin: Plugin, @unchecked Sendable {

    nonisolated public init() {}

    // MARK: - Metadata

    public var metadata: PluginMetadata {
        PluginMetadata(
            name: "invoice-payment",
            version: SemanticVersion(1, 0, 0),
            description: "Invoice payment — pay by bank transfer after receiving an invoice.",
            author: "VBWD",
            keywords: ["payment", "invoice"],
            dependencies: .none,
            translations: [
                "en": [
                    "invoice.payment.title": "Invoice Payment",
                    "invoice.payment.info": "An invoice will be sent to your email address. Payment is due within the period specified on the invoice.",
                    "invoice.payment.instructions": "You will receive payment instructions by email after checkout.",
                ],
            ]
        )
    }

    // MARK: - Lifecycle

    public func install(_ sdk: PlatformSDK) async throws {
        // PaymentMethod* convention: declares "invoice" as a supported payment
        // method code AND provides the detail view shown when the user selects
        // this method in the checkout payment picker.
        sdk.addComponent("PaymentMethodInvoice") {
            AnyView(InvoiceInfoSection())
        }

        // Translations
        for (locale, messages) in metadata.translations {
            sdk.addTranslations(locale, messages)
        }
    }
}
