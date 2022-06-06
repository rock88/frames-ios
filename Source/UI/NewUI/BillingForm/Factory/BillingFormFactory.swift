import UIKit

public struct BillingFormFactory {

    public static var defaultBillingFormStyle: BillingFormStyle {
        DefaultBillingFormStyle()
    }

    // in order
    static var cellsStyleInOrder: [BillingFormCell] {
        [.fullName(DefaultBillingFormFullNameCellStyle()),
         .addressLine1(DefaultBillingFormAddressLine1CellStyle()),
         .addressLine2(DefaultBillingFormAddressLine2CellStyle()),
         .city(DefaultBillingFormCityCellStyle()),
         .state(DefaultBillingFormStateCellStyle()),
         .postcode(DefaultBillingFormPostcodeCellStyle()),
         .country(DefaultBillingFormCountryCellStyle()),
         .phoneNumber(DefaultBillingFormPhoneNumberCellStyle())]
    }

    static func getBillingFormViewController(style: BillingFormStyle?, data: BillingForm?, delegate: BillingFormViewModelDelegate) -> (BillingFormViewModelDelegate?, UINavigationController)? {

        guard let style = style, !style.cells.isEmpty else { return nil }

        let viewModel = DefaultBillingFormViewModel(style: style, data: data, delegate: delegate)

        let viewController = BillingFormViewController(viewModel: viewModel)

        if #available(iOS 13.0, *) {
            viewController.isModalInPresentation  = true
        }
        let navigationController = UINavigationController(rootViewController: BillingFormViewController(viewModel: viewModel))

        return (viewModel.delegate, navigationController)
    }

}
