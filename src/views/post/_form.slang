- if post.errors
  ul.errors
    - post.errors.each do |error|
      li = error.to_s

== form(action: "/posts/#{post.id.to_s}", method: post.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.id]}, selected: post.user_id, class: "form-control")
  .form-group
    == label(:topic)
    == select_field(name: "topic_id", collection: Topic.all.map{|topic| [topic.id, topic.id]}, selected: post.topic_id, class: "form-control")
  .form-group
    == text_area(name: "content", content: post.content, placeholder: "Content", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/posts", class: "btn btn-light btn-sm")
