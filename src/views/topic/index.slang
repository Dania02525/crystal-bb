.row
  .col-sm-11
    h2 Topics
  .col-sm-1
    a.btn.btn-success.btn-sm href="/topics/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th User
        th Forum
        th Title
        th Content
        th Actions
    tbody
      - topics.each do |topic|
        tr
          td = topic.user.id
          td = topic.forum.id
          td = topic.title
          td = topic.content
          td
            span
              == link_to("Show", "/topics/#{topic.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/topics/#{topic.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/topics/#{ topic.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
