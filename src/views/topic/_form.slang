- if topic.errors
  ul.errors
    - topic.errors.each do |error|
      li = error.to_s

== form(action: "/topics/#{topic.id.to_s}", method: topic.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.id]}, selected: topic.user_id, class: "form-control")
  .form-group
    == label(:forum)
    == select_field(name: "forum_id", collection: Forum.all.map{|forum| [forum.id, forum.id]}, selected: topic.forum_id, class: "form-control")
  .form-group
    == text_field(name: "title", value: topic.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_area(name: "content", content: topic.content, placeholder: "Content", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/topics", class: "btn btn-light btn-sm")
