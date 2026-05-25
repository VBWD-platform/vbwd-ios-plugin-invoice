import SwiftUI
import VBWDCore

/// Detail view shown inline when the user selects "Invoice" as payment method.
/// Rendered inside the Payment Method card via the `PaymentMethodInvoice`
/// component convention.
struct InvoiceInfoSection: View {
    @Environment(\.appTheme) var theme

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("An invoice will be sent to your email address. Payment is due within the period specified on the invoice.")
                .font(.caption)
                .foregroundColor(theme.textSecondary)

            HStack(spacing: 6) {
                Image(systemName: "envelope.fill")
                    .font(.caption2)
                    .foregroundColor(theme.accent)
                Text("You will receive payment instructions by email after checkout.")
                    .font(.caption2)
                    .foregroundColor(theme.textSecondary)
            }
        }
        .padding(.leading, 36)
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityIdentifier("checkout_invoice_info")
    }
}
