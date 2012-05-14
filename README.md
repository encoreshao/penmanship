# Bootstrap for Rails 3.x
Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites.
bootstrap provides simple and flexible HTML, CSS, and Javascript for popular user interface components and interactions. 
twitter-bootstrap-rails project integrates Bootstrap CSS toolkit for Rails 3 projects

## Thanks
Thanks Twitter for Bootstrap
http://twitter.github.com/bootstrap

## Rails 3.x
Include lavender in Gemfile;

    gem 'lavender', '~> 0.0.1'
    
or you can install from latest build;

    gem 'lavender', :git => 'http://github.com/fmmp3/lavender.git'
    
and run bundle install.

Add necessary stylesheet file to app/assets/stylesheets/application.css.scss

    *= require_self
    *= require bootstrap
    *= require bootstrap-responsive
    *= require docs
    
Also you can add javascript support, expend your application.js like this:

    //= require jquery
    //= require jquery_ujs

    //= require bootstrap-transition
    //= require bootstrap-alert
    //= require bootstrap-modal
    //= require bootstrap-dropdown
    //= require bootstrap-scrollspy
    //= require bootstrap-tab
    //= require bootstrap-tooltip
    //= require bootstrap-popover
    //= require bootstrap-button
    //= require bootstrap-collapse
    //= require bootstrap-carousel
    //= require bootstrap-typeahead
    

## Credits
Encore Shao - encore.shao [at] gmail com

[Follow me on Twitter](http://twitter.com/fmmp3 "Twitter")

## Contributors
<ul>
  <li>Encore Shao</li>
</ul>

## License
Copyright (c) 2011 Encore Shao

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.