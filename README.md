# mailarchiva

A ruby gem to access the [Mailarchiva] API.  Refer to the [Mailarchiva API] for more info.

```ruby
require 'mailarchiva'
mailarchiva = Mailarchiva::Client.new(host: '192.168.1.1', user: 'user', pass: 'pass')
mailarchiva.search_by_subject('test') # An array of Mail messages
```

[Mailarchiva]:https://www.mailarchiva.com/
[Mailarchiva API]:https://www.mailarchiva.com/help/display/MAIL/Web+Services+API
