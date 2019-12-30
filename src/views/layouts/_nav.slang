- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/forums" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/forums" Forums
- active = context.request.path == "/topics" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/topics" Topics
- active = context.request.path == "/posts" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/posts" Posts
