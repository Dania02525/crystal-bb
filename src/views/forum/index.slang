.row
  .col-sm-11
    h2 Forums
  .col-sm-1
    a.btn.btn-success.btn-sm href="/forums/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Description
        th Actions
    tbody
      - forums.each do |forum|
        tr
          td = forum.name
          td = forum.description
          td
            span
              == link_to("Show", "/forums/#{forum.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/forums/#{forum.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/forums/#{ forum.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
