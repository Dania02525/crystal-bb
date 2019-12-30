- if forum.errors
  ul.errors
    - forum.errors.each do |error|
      li = error.to_s

== form(action: "/forums/#{forum.id.to_s}", method: forum.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: forum.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "description", value: forum.description, placeholder: "Description", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/forums", class: "btn btn-light btn-sm")
