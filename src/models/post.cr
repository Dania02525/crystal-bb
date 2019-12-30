class Post < Granite::Base
  connection pg
  table posts

  belongs_to :user

  belongs_to :topic

  column id : Int64, primary: true
  column content : String?
  timestamps
end
