# mailarchiva

A ruby gem to access the [Mailarchiva] API.  Refer to the [Mailarchiva API] for more info.

```ruby
require 'mailarchiva'
mailarchiva = Mailarchiva::Client.new(host: '192.168.1.1', user: 'user', pass: 'pass')
mailarchiva_messages = mailarchiva.search_by_subject('test') # An array of Mailarchiva::Message
mailarchiva_message = results.first # A Mailarchiva::Message
mailarchiva_message.mail_message # A Mail::Message

sent_before = Time.now.strftime("%Y/%m/%d %I:%M%p")
sent_after = (Time.now - 86400).strftime("%Y/%m/%d %I:%M%p")
params = {sent_after: sent_after, sent_before: sent_before, query: "allsenders=\"e09des0237t@sepdf.gob.mx\""}
mailarchiva_messages = mailarchiva.search(params)
```
## TODO
test

[Mailarchiva]:https://www.mailarchiva.com/
[Mailarchiva API]:https://www.mailarchiva.com/help/display/MAIL/Web+Services+API