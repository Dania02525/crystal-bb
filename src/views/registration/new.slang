h1 Sign Up

- if user
  - if user.errors
    ul.errors
    - user.errors.each do |error|
      li = error.to_s
- if @validation_errors
  - @validation_errors.not_nil!.each do |error|
      li = error.message

form action="/registration" method="post"
  == csrf_tag
  .form-group
    input.form-control type="email" name="email" placeholder="Email"
  .form-group
    input.form-control type="password" name="password" placeholder="Password"
  button.btn.btn-success.btn-sm type="submit"
    | Register
<hr/>
== link_to("Already have an account?", "/signin")
