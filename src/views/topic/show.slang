h1 Show Topic
p = topic.user.id
p = topic.forum.id
p = topic.title
p = topic.content
p
  == link_to("Back", "/topics", class: "btn btn-light btn-sm")
  == link_to("Edit", "/topics/#{topic.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/topics/#{topic.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
