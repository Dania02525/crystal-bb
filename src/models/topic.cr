class Topic < Granite::Base
  connection pg
  table topics

  belongs_to :user

  belongs_to :forum

  column id : Int64, primary: true
  column title : String?
  column content : String?
  timestamps
end
