1.upto(5) do |i|
  Post.create(title: "title #{i}", body: "body #{i}")
end
