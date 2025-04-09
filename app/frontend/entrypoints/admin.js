
// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
import * as ActiveStorage from '@rails/activestorage'
ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

import $ from 'jquery'
import '../../../vendor/assets/javascripts/jquery.timepicker';

// stylesheets
import '../../assets/stylesheets/application/loveli-icons.css.scss';
import '../../../vendor/assets/stylesheets/jquery.timepicker.css';
import '../../assets/stylesheets/admin/admin_forms.css.scss'

$(function() {
  $('.timepicker').timepicker()
  $('.text_copy').bind('click', function() {
    $(this).select()
  });

  $('#notice').bind('click', function() {
    $(this).fadeOut()
  })

  setTimeout(function() { $('#notice').fadeOut() }, 3500)
});

