## Get MessagePack message example

```
rails new blog_mpac && cd blog_mpac
rails g scaffold Post title body:text && rake db:setup

pry -r msgpack -r uri -r 'net/http'
res = Net::HTTP.get(URI.parse('http://0.0.0.0:3000/posts/1.mpac/'))
MessagePack.unpack(res)
```

## Send MessagePack resuest example

```
$ pry -r msgpack -r uri -r 'net/http' -r json
[1] pry(main)> body = MessagePack.pack( JSON.load('{"post":{"title":"msgpack test","body":"Hello MessagePack"},"commit":"Update Post"}') )
=> "\x82\xA4post\x82\xA5title\xACmsgpack test\xA4body\xB1Hello MessagePack\xA6commit\xABUpdate Post"
[2] pry(main)> proxy = Net::HTTP::Proxy('localhost',8080).new('localhost',3000)
=> #<#<Class:0x00000001b54040> localhost:3000 open=false>
[3] pry(main)> resp = proxy.patch( "/posts/1.msgpack", body, {'Content-Type' =>'application/msgpack'} )
=> #<Net::HTTPOK 200 OK  readbody=true>
[4] pry(main)> MessagePack.unpack(resp.body)
=> {"id"=>1, "title"=>"msgpack test", "body"=>"Hello MessagePack", "created_at"=>"2016-04-18T04:37:39.325Z", "updated_at"=>"2016-04-18T04:38:18.044Z"}
```