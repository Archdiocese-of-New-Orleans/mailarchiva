# mailarchiva

A ruby gem to access the [Mailarchiva] API.  Refer to the [Mailarchiva API] for more info.

```ruby
require 'mailarchiva'
mailarchiva = Mailarchiva::Client.new(host: '192.168.1.1', user: 'user', pass: 'pass')
results = mailarchiva.search_by_subject('test') # An array of Mailarchiva::Message

mailarchiva.get_message(results.first) # A Mail message
```

[Mailarchiva]:https://www.mailarchiva.com/
[Mailarchiva API]:https://www.mailarchiva.com/help/display/MAIL/Web+Services+API
