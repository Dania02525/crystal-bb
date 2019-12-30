h1 Show Forum
p = forum.name
p = forum.description
p
  == link_to("Back", "/forums", class: "btn btn-light btn-sm")
  == link_to("Edit", "/forums/#{forum.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/forums/#{forum.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
