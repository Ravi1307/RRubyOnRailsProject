class Rblog < ActiveRecord::Base
  
  scope :recent, lambda { |a, l, o| ((a == 'all') ? order(:id => :desc).offset(o).limit(l) : where(:author => a).order(:id => :desc).limit(l).offset(o)) };
  scope :post_titles, lambda { |author| where(:author => author) };
  scope :authors, lambda { distinct.pluck(:author) };
  scope :count_authors, lambda { |author| where(:author => author).count };
  
end
