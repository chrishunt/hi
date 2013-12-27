[![Travis CI](https://travis-ci.org/chrishunt/hi.png)](https://travis-ci.org/chrishunt/hi)
[![Coverage Status](https://coveralls.io/repos/chrishunt/hi/badge.png?branch=master)](https://coveralls.io/r/chrishunt/hi)
[![Code Climate](https://codeclimate.com/github/chrishunt/hi.png)](https://codeclimate.com/github/chrishunt/hi)

![](https://raw2.github.com/chrishunt/hi/master/screenshot.png)

### hi, I'm here to debug your HTTP

[chrishunt.co/hi](http://chrishunt.co/hi/)

## Description

`hi` is a simple HTTP server that will accept any request you throw at it and
reply with 'hi'. Since all requests are dumped to the console, it's probably
most useful for debugging.

Get started by installing the gem:

```bash
$ gem install hi
```

Then start up the server:

```bash
$ hi
>> Thin web server (v1.5.1 codename Straight Razor)
>> Maximum connections set to 1024
>> Listening on 0.0.0.0:3000, CTRL+C to stop
```

The default port is `3000`. You can start on another port if you like:

```bash
$ hi 1234
>> Thin web server (v1.5.1 codename Straight Razor)
>> Maximum connections set to 1024
>> Listening on 0.0.0.0:1234, CTRL+C to stop
```

Now start debugging those requests:

```bash
$ curl localhost:3000/foo/bar\?message=hello

"GET http://localhost:3000/foo/bar?message=hello (2013-12-27 14:18:16 -0800)"
{
              :host => "localhost",
                :ip => "127.0.0.1",
              :port => 3000,
    :request_method => "GET",
            :scheme => "http",
               :url => "http://localhost:3000/foo/bar?message=hello",
      :query_string => "message=hello",
              :body => "",
    :content_length => nil,
        :media_type => nil,
           :referer => nil,
        :user_agent => "curl/7.30.0",
               :xhr => false,
           :headers => {
           "HTTP_VERSION" => "HTTP/1.1",
        "HTTP_USER_AGENT" => "curl/7.30.0",
              "HTTP_HOST" => "localhost:3000",
            "HTTP_ACCEPT" => "*/*"
    }
}
```

`hi` accepts anything. Try a `POST` instead:

```bash
$ curl -d 'message=hello' localhost:3000

"POST http://localhost:3000/ (2013-12-27 14:18:59 -0800)"
{
              :host => "localhost",
                :ip => "127.0.0.1",
              :port => 3000,
    :request_method => "POST",
            :scheme => "http",
               :url => "http://localhost:3000/",
      :query_string => "",
              :body => "message=hello",
    :content_length => "13",
        :media_type => "application/x-www-form-urlencoded",
           :referer => nil,
        :user_agent => "curl/7.30.0",
               :xhr => false,
           :headers => {
           "HTTP_VERSION" => "HTTP/1.1",
        "HTTP_USER_AGENT" => "curl/7.30.0",
              "HTTP_HOST" => "localhost:3000",
            "HTTP_ACCEPT" => "*/*"
    }
}
```

Or an xhr request:

```bash
$ curl -H 'X-Requested-With: XMLHttpRequest' -d "message=hello" localhost:3000

"POST http://localhost:3000/ (2013-12-27 14:19:24 -0800)"
{
              :host => "localhost",
                :ip => "127.0.0.1",
              :port => 3000,
    :request_method => "POST",
            :scheme => "http",
               :url => "http://localhost:3000/",
      :query_string => "",
              :body => "message=hello",
    :content_length => "13",
        :media_type => "application/x-www-form-urlencoded",
           :referer => nil,
        :user_agent => "curl/7.30.0",
               :xhr => true,
           :headers => {
                 "HTTP_VERSION" => "HTTP/1.1",
              "HTTP_USER_AGENT" => "curl/7.30.0",
                    "HTTP_HOST" => "localhost:3000",
                  "HTTP_ACCEPT" => "*/*",
        "HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"
    }
}
```

## Installation

```bash
$ gem install hi
```

## Contributing
Please see the [Contributing
Document](https://github.com/chrishunt/hi/blob/master/CONTRIBUTING.md)

## Changelog
Please see the [Changelog
Document](https://github.com/chrishunt/hi/blob/master/CHANGELOG.md)

## License
Copyright (C) 2013 Chris Hunt, [MIT
License](https://github.com/chrishunt/hi/blob/master/LICENSE.txt)
