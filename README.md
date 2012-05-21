## Penmanship - Rails HTML CSS Javascript made easy.
The idea came from Twitter Bootstrap.
Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites.
Bootstrap provides simple and flexible HTML, CSS, and Javascript for popular user interface components and interactions. 
twitter-bootstrap-rails project integrates Bootstrap CSS toolkit for Rails 3 projects

### Twitter Bootstrap
Thanks Twitter for Bootstrap http://twitter.github.com/bootstrap

## Installation

Add it to your Gemfile:

`gem 'penmanship', :git => 'git://github.com/encoreshao/penmanship.git'`

Run the following command to install it:

`bundle install`

## Usage

To start using **Penmanship** you just have to use the application.css it provides:

```erb
	*= require_self
	*= require bootstrap
	*= require bootstrap-responsive
	*= require docs
```

To start using **Penmanship** you just have to use the application.js it provides:

```erb
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
```
    

## Credits
Encore Shao - encore.shao [at] gmail com

[Follow me on Twitter](http://twitter.com/encoreshao "Twitter")

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