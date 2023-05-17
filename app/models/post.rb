class Post < ActiveRecord::Base
  include Visible

  has_many :comments, dependent: :destroy 

  validates :title, presence: true, 
                    length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 10 }
end 