# Form Objects example

A quick example of how to use form objects for a contact form.

## Key files

* app/forms/contact_form.rb - The actual form object
* config/locales/en.yml - Locals of the form object
* app/controllers/contact_us_controller.rb - Controller stiching the form object and view together.
* app/views/contact_us/_form.html.erb - Simple Form implementation of the form.

## Take it for a spin

Clone this repo, download the gems then turn on the server:

    git clone git@github.com:kyan/FormObjectsExample.git
    cd FormObjectsExample
    bundle
    spring rails s
