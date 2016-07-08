class Rblog < ActiveRecord::Base
  
  scope :recent, lambda { |l, o| order("rblogs.id DESC").limit(l).offset(o) };
  
end
