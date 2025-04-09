// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

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
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

import '../../assets/javascripts/onload.js';
import '../../assets/javascripts/podcastButton.js';

// stylesheets
import '../../assets/stylesheets/application/about.css.scss';
import '../../assets/stylesheets/application/banner.css.scss';
import '../../assets/stylesheets/application/loveli-icons.css.scss';
import '../../assets/stylesheets/application/main.css.scss';
import '../../assets/stylesheets/application/search.css.scss';
import '../../assets/stylesheets/application/site-nav.css.scss';
import '../../assets/stylesheets/application/tooltips.css.scss';
import '../../assets/stylesheets/application/tracks.css.scss';
