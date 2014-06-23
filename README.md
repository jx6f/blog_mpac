```
rails new blog_mpac && cd blog_mpac
rails g scaffold Post title body:text && rake db:setup

pry -r msgpack -r uri -r 'net/http'
res = Net::HTTP.get(URI.parse('http://0.0.0.0:3000/posts/1.mpac/'))
MessagePack.unpack(res)
```
