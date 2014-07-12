class Post < ActiveRecord::Base
# attr_accessible :content, :contributor, :post_nnumber
 belongs_to :topic
end
