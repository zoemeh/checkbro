module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.slim',
    './app/components/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ]
}
