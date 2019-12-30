class Forum < Granite::Base
  connection pg
  table forums

  column id : Int64, primary: true
  column name : String?
  column description : String?
  timestamps
end
