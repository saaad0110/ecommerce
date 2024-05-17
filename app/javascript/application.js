// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"
// = require jquery
//= require turbolinks
import "jquery"
global.$ = jQuery;
import "./script";  // then your other imports that use `$`

// NOTE: don't use relative imports: `import "./script"`
//       add `pin "script"` to `importmap.rb`

console.log($); // ok

