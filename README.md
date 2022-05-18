# mailarchiva

A ruby gem to access the [Mailarchiva] API.  Refer to the [Mailarchiva API] for more info.

```ruby
require 'mailarchiva'
mailarchiva = Mailarchiva::Client.new(ssl: false, host: '192.168.1.1', key: 'api_key')
params = { query: "subject:test", page: 1, pageSize: 1000 } # http://help.mailarchiva.com/web-services-api
mailarchiva_messages = mailarchiva.search(params)

```

## TODO
test

[Mailarchiva]:https://www.mailarchiva.com/
[Mailarchiva API]:http://help.mailarchiva.com/web-services-api