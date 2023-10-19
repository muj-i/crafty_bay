# CraftyBay

## Description
CraftyBay is a feature-rich ecommerce app designed to provide users with a seamless and enjoyable shopping experience. With a focus on user-friendliness and a wide range of products, CraftyBay allows users to explore, purchase, and review products with ease.

## Responsibilities
As the creator of CraftyBay, my responsibilities included:

 - App Development: Developing and designing the CraftyBay ecommerce app, ensuring a user-friendly interface and smooth navigation.

 - Product Management: Organizing products into categories. Implementing a dynamic product carousel slider for an engaging shopping experience.

 - User Profiles: Enabling users to create and manage their profiles, making it convenient for them to track their orders and preferences.

 - Product Customization: Implementing the ability for users to select products by color and size, ensuring they can find items that suit their preferences.

 - Wishlist Functionality: Allowing users to add products to their wishlist, making it easy for them to save items they are interested in for future purchases.

 - Product Reviews: Incorporating a review system, enabling users to share their thoughts and experiences with purchased products.

## Challenges Faced
During the development of CraftyBay, several challenges were encountered, including:

 - User Authentication: Overcoming the challenge of securely saving and managing user tokens to ensure data privacy and user account protection.

 - Navigation Design: Creating an intuitive and user-friendly navigation system that helps users easily access their cart, wishlist, and additional options.

 - State Management and API Optimization: Ensuring efficient state management within the app and minimizing unnecessary API calls to enhance performance and reduce data usage.

How Challenges Were Overcome
To address these challenges, several strategies and solutions were implemented:

 - User Authentication: Rigorous security measures were put in place to safeguard user tokens, ensuring that user accounts and data are protected from unauthorized access.

 - Navigation Design: Extensive user testing and feedback collection were conducted to refine the app's navigation, making it as intuitive as possible for users to access their cart, wishlist, and other options.

 - State Management: We implemented a robust state management system, utilizing tools and libraries such as GetX or the built-in setState mechanism, depending on the app's architecture. This allowed us to efficiently manage the app's state, ensuring data consistency and responsiveness.

 - Reducing API calls: To optimize app performance, we've reduced the number of API calls where data is fetched and updated only when needed, reducing app data consumption and enhancing user experience.

CraftyBay is continuously evolving to enhance the shopping experience for users, and your feedback and contributions are welcome. Thank you for considering CraftyBay for your ecommerce needs!


## CraftyBay UI

### Video demonstration of News Reader

[![Video](https://img.youtube.com/vi/xxx/hqdefault.jpg)](https://www.youtube.com/watch?v=xxxx)

### Online Screen
<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss0.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss1.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss2.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss3.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss4.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss5.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss11.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss6.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss7.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss8.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss9.png" width="200" />
    <img src="https://github.com/muj-i/crafty_bay/blob/main/screenshots/ss10.png" width="200" />
</div>

## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

Follow these steps to run the CraftyBay Application:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/muj-i/crafty_bay.git
```

2. Navigate to the project folder:

```bash
cd crafty_bay
```

3. Install dependencies:

```bash
flutter pub get
```

### How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run
```
## Used Packages

CraftyBay integrates the following packages to enhance functionality:
 - `flutter_svg: ^2.0.7:` A Flutter package for rendering SVG (Scalable Vector Graphics) images. It allows you to easily display and manipulate SVG files in your Flutter application.
 - `get: ^4.6.5:` Get is a state management library for Flutter that simplifies the process of managing application state. It provides a clean and efficient way to handle state and dependencies in your app.
 - `font_awesome_flutter: ^10.5.0:` This package allows you to easily integrate Font Awesome icons into your Flutter application. Font Awesome is a popular library of vector icons.
 - `pin_code_fields: ^8.0.1:` Pin Code Fields is a Flutter package that helps you implement PIN or OTP input fields in your app. It's highly customizable and easy to use for user authentication and verification.
 - `carousel_slider: ^4.2.1:` Carousel Slider is a package for creating image carousels and sliders in your Flutter app. It's useful for creating interactive and dynamic image galleries.
 - `http: ^1.1.0:` The HTTP package provides a straightforward way to make HTTP requests in your Flutter app. It's essential for fetching data from APIs and working with web services.
 - `flutter_launcher_icons: ^0.13.1:` This package simplifies the process of generating and setting app icons for your Flutter application. It allows you to customize app icons with ease.
 - `shared_preferences: ^2.2.1:` Shared Preferences is a Flutter package for persisting simple key-value data in a platform-agnostic manner. It's commonly used for storing app settings and small amounts of data.
 - `shimmer: ^3.0.0:` Shimmer is a package for adding a shimmering effect to your Flutter widgets. It's often used to create loading or placeholder animations to improve user experience.
 - `connectivity_plus: ^5.0.1:` Connectivity Plus is a Flutter package for monitoring network connectivity. It helps you check the status of the device's network connection and react to changes in connectivity.
  
## Project Directory Structure

The CraftyBay directory structure is organized as follows:

```
  .
└── crafty_bay/
    ├── assets/
    │   ├── images/
    │   │   ├── logo_nav.svg
    │   │   └── logo.svg
    │   └── logo/
    │       └── logo.png
    └── lib/
        ├── application/
        │   ├── app.dart
        │   └── state_holder_binder.dart
        ├── data/
        │   ├── models/
        │   │   ├── cart_and_wish_list_model.dart
        │   │   ├── categories_model_data.dart
        │   │   ├── categories_model.dart
        │   │   ├── get_product_review_model.dart
        │   │   ├── network_response.dart
        │   │   ├── product_data.dart
        │   │   ├── product_details_model.dart
        │   │   ├── product_model.dart
        │   │   ├── slider_model_data.dart
        │   │   ├── slider_model.dart
        │   │   └── user_profile_model.dart
        │   ├── services/
        │   │   └── network_caller.dart
        │   └── utils/
        │       └── urls.dart
        ├── presentation/
        │   ├── state_holders/
        │   │   ├── auth/
        │   │   │   ├── auth_token_controller.dart
        │   │   │   ├── create_profile_controller.dart
        │   │   │   ├── email_verification_controller.dart
        │   │   │   ├── pin_verification_controller.dart
        │   │   │   └── read_profile_controller.dart
        │   │   ├── add_to_cart_controller.dart
        │   │   ├── bottom_nav_base_controller.dart
        │   │   ├── cart_list_controller.dart
        │   │   ├── categories_controller.dart
        │   │   ├── categories_list_controller.dart
        │   │   ├── create_product_review_controller.dart
        │   │   ├── create_wish_list_controller.dart
        │   │   ├── delete_cart_item_controller.dart
        │   │   ├── get_product_review_controller.dart
        │   │   ├── home_slider_controller.dart
        │   │   ├── new_product_controller.dart
        │   │   ├── popular_product_controller.dart
        │   │   ├── product_details_controller.dart
        │   │   ├── special_product_controller.dart
        │   │   └── wish_list_controller.dart
        │   └── ui/
        │       ├── screens/
        │       │   ├── auth/
        │       │   │   ├── complete_profile_screen.dart
        │       │   │   ├── email_verification_screen.dart
        │       │   │   ├── pin_verification_screen.dart
        │       │   │   └── read_profile_screen.dart
        │       │   ├── add_product_review_screen.dart
        │       │   ├── bottom_nav_base_screen.dart
        │       │   ├── cart_list_screen.dart
        │       │   ├── categories_list_screen.dart
        │       │   ├── categories_product_list_screen.dart
        │       │   ├── home_screen.dart
        │       │   ├── product_details_screen.dart
        │       │   ├── product_list_screen.dart
        │       │   ├── product_review_screen.dart
        │       │   ├── splash_screen.dart
        │       │   └── wish_list_screen.dart
        │       ├── utils/
        │       │   ├── asset_images.dart
        │       │   ├── color_palette.dart
        │       │   ├── constraints.dart
        │       │   └── custom_sncakbar.dart
        │       └── widgets/
        │           ├── auth/
        │           │   ├── auth_screens_upper_parts.dart
        │           │   └── otp_expiry_counter_and_resend_button.dart
        │           ├── home/
        │           │   ├── shimmers/
        │           │   │   ├── categories_shimmer.dart
        │           │   │   ├── home_slider_shimmer.dart
        │           │   │   └── products_shimmer.dart
        │           │   ├── appbar_action_buttons.dart
        │           │   ├── home_carousel_slider.dart
        │           │   ├── home_search_field.dart
        │           │   └── section_header.dart
        │           ├── product_details/
        │           │   ├── product_color_picker.dart
        │           │   ├── product_details_carousel_slider.dart
        │           │   ├── product_details_shimmer.dart
        │           │   ├── product_size_picker.dart
        │           │   ├── rating_review_wishbutton_row.dart
        │           │   └── section_title.dart
        │           ├── all_over_appbar.dart
        │           ├── all_over_elevatedbutton.dart
        │           ├── bottom_container_button.dart
        │           ├── bottom_container.dart
        │           ├── cart_product_card.dart
        │           ├── category_card.dart
        │           ├── custom_stepper.dart
        │           ├── home_icon_button.dart
        │           ├── product_card.dart
        │           ├── product_review_list_tile.dart
        │           ├── shimmer_container.dart
        │           └── wish_list_product_card.dart
        └── main.dart
```

## Contributors

- [Mujahedul Islam](https://github.com/muj-i)

## Special Thanks

### A heartfelt thanks to my mentors:

 - [Rabbil Hasan](https://github.com/rupomsoft) for his enlightening prerecorded classes and [Md Rafat J. M.](https://github.com/RafatMeraz) for teaching me how to make UI like this and the API integration seamless.

### A heartfelt thanks to my classmates:

- [Moniruzzaman](https://github.com/moniruzzaman76) & [Md Alhaz Mondal Hredhay](https://github.com/hredhayxz) to share their knowledges with me & help me complete the project.

## License

This project is licensed under the MIT License. Refer to the [LICENSE](https://opensource.org/license/mit/) file for details.

