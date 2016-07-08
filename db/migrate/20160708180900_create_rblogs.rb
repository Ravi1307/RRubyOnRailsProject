class CreateRblogs < ActiveRecord::Migration
  
  def up
    
    create_table :rblogs do |t|
      
      t.string "author", :null => false;
      t.string "post_title", :null => false;
      t.text "post_message", :null => false;
      t.timestamps :null => false;
      
    end
    
  end
  
  def down
    
    drop_table :rblogs;
    
  end
  
end
