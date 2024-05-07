// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"
// = require jquery

import "jquery"
//= require turbolinks
import "./script";  // then your other imports that use `$`

// NOTE: don't use relative imports: `import "./script"`
//       add `pin "script"` to `importmap.rb`

console.log($); // ok

// $(document).ready(function() {
//     $('.update-quantity').on('input', function() {
//         var newQuantity = $(this).val();
//         var productId = $(this).data('product-id');
        
//         $.ajax({
//             url: '/update_quantity', // Your server endpoint for updating quantity
//             method: 'POST',
//             data: { product_id: productId, quantity: newQuantity },
//             dataType: 'json',
//             success: function(response) {
//                 // Update the displayed quantity on the webpage
//                 // Assuming there's a span with class 'displayed-quantity' where you want to display the updated quantity
//                 $('.displayed-quantity-' + productId).text(newQuantity);
//             },
//             error: function(xhr, status, error) {
//                 console.error("Error updating quantity:", error);
//             }
//         });
//     });
// });
