# Eshop Application

Eshop is an online shopping application where users can browse products, add them to their cart, place orders, mark products as favorites, and manage their account.

## Features

- **Browse Products**: Users can view a list of available products with details like name, price, and description.
- **Add Products**: Sellers can add their products to the platform, specifying details such as name, price, quantity, and category.
- **View Cart**: Users can add products to their cart and view the items they have selected for purchase.
- **Place Orders**: Users can place orders for the products in their cart, specifying delivery address and payment method.
- **Favorite Products**: Users can mark products as favorites to easily access them later.
- **Account Management**: Users can register, log in, and manage their profile, including updating personal information and viewing order history.

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript, React.js
- **Backend**: Node.js, Express.js, MongoDB
- **APIs**: RESTful API for fetching and updating product information, user authentication, and order processing.

## Setup Instructions

1. Clone the repository: `git clone <repository-url>`
2. Install dependencies: `npm install`
3. Start the development server: `npm start`
4. Navigate to `http://localhost:3000` in your web browser to access the application.

## API Endpoints

- `GET /api/products`: Get a list of all products.
- `GET /api/products/:id`: Get details of a specific product by ID.
- `POST /api/products`: Add a new product.
- `PUT /api/products/:id`: Update details of an existing product.
- `DELETE /api/products/:id`: Delete a product.
- `POST /api/users/register`: Register a new user.
- `POST /api/users/login`: Log in a user.
- `GET /api/users/:id/orders`: Get order history for a specific user.
- `POST /api/orders`: Place a new order.

## Future Enhancements

- Implement product search and filtering options.
- Integrate payment gateway for secure online transactions.
- Enhance user experience with features like ratings and reviews.
- Implement user roles and permissions for sellers and administrators.
- Add social sharing functionality for products.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your proposed changes.

## License

This project is licensed under the [MIT License](LICENSE).
##Screenshot
<span>
<img src="https://github.com/kartikpachori/ShopApp/blob/main/assets/images/Pick1.jpg" width="18%" height="45%">
<img src="https://github.com/kartikpachori/ShopApp/blob/main/assets/images/Pick2.jpg" width="18%" height="45%">
<img src="https://github.com/kartikpachori/ShopApp/blob/main/assets/images/Pick3.jpg" width="18%" height="45%">
<img src="https://github.com/kartikpachori/ShopApp/blob/main/assets/images/Pick4.jpg" width="18%" height="45%">
<img src="https://github.com/kartikpachori/ShopApp/blob/main/assets/images/Pick5.jpg" width="18%" height="45%">
</span>
