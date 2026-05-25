# vbwd-ios-plugin-invoice

Invoice payment plugin for **[vbwd-ios-core](https://github.com/VBWD-platform/vbwd-ios-core)** — adds "Invoice" (bank transfer) as a payment method in checkout.

## What this plugin does

| Feature | SDK seam used |
|---|---|
| "Invoice" payment method detail view | `sdk.addComponent("PaymentMethodInvoice", ...)` |
| Localised payment instructions (en) | `sdk.addTranslations()` |

When the user selects "Invoice" as their payment method during checkout, this plugin renders an informational section explaining that an invoice will be sent by email with payment instructions.

## Architecture

```
Sources/InvoicePaymentPlugin/
├── InvoicePaymentPlugin.swift       ← Composition root (registration only)
└── Views/
    └── InvoiceInfoSection.swift     ← Checkout detail view (accessibility: checkout_invoice_info)
```

This is an intentionally **thin plugin**. All invoice creation, validation, and business logic is handled by the backend. The plugin provides only the UI layer for the payment method selection screen.

## Translations

| Key | English |
|---|---|
| `invoice.payment.title` | Invoice Payment |
| `invoice.payment.info` | An invoice will be sent to your email address. Payment is due within the period specified on the invoice. |
| `invoice.payment.instructions` | You will receive payment instructions by email after checkout. |

## Quick Start

### 1. Clone alongside vbwd-ios-core

```bash
cd your-app/Packages
git submodule add https://github.com/VBWD-platform/vbwd-ios-plugin-invoice.git
```

### 2. Add to Xcode

1. Open your `.xcodeproj`
2. Add local package: `Packages/vbwd-ios-plugin-invoice`
3. Add `InvoicePaymentPlugin` framework to your target

### 3. Register in your app

```swift
import VBWDCore
import InvoicePaymentPlugin

@main
struct MyApp: App {
    @MainActor private static let container = SDKContainer()

    var body: some Scene {
        WindowGroup {
            AppRoot(
                container: MyApp.container,
                plugins: [InvoicePaymentPlugin()],
                manifestLoader: BundledPluginManifestLoader()
            )
        }
    }
}
```

### 4. Enable in plugins.json

```json
{
  "plugins": {
    "invoice-payment": {
      "enabled": true,
      "version": "1.0.0",
      "source": "local"
    }
  }
}
```

## Requirements

- Swift 6.0+ / Xcode 16+
- iOS 16+ / macOS 13+
- `vbwd-ios-core` as a sibling package

## License

BSL 1.1 (Business Source Licence)
