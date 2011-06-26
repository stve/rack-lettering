Rack::Lettering
===============

Rack::Lettering is a Rack Middleware for inserting [Lettering.js](http://letteringjs.com/) style syntax into a response body.

It was built during [ConvergeSE](http://convergese.com/) 2011 and was inspired by a talk given by [Trent Walton](http://trentwalton.com/) about CSS Typography.

Installation
------------

(sudo) gem install rack-lettering

Usage
-----

Rack::Lettering accepts an options hash that allows you to define the lettering treatment (letters, words, or lines) you'd like for a given selector. Any CSS selector may be used.

```ruby
  require 'rack/lettering'
  use Rack:Lettering, :letters => ['#letter_selector'], :words => ['.word_selector'], :lines => ['#line_selector']
```

Caveat
------

I haven't actually compared the results with those from lettering.js.  The project has tests, but there may be edge cases I've missed.  Please feel free to fork and send pull requests if you find anything that's broken.

License
-------
Copyright (c) 2011 Steve Agalloco

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
