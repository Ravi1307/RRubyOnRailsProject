class Rblog < ActiveRecord::Base
  
  scope :recent, lambda { |a, l, o| ((a == nil) ? order("rblogs.id DESC").offset(o).limit(l) : where(:author => a).order("rblogs.id DESC").limit(l).offset(o)) };
  scope :post_titles, lambda { |author| where(:author => author) };
  scope :authors, lambda { pluck('DISTINCT author') };
  scope :count_authors, lambda { |author| where(:author => author).count };
  
end
