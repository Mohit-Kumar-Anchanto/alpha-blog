class Article < ApplicationRecord

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  #Validations
  validates :title ,presence:true , length: {minimum:6, maximum:18}
  validates :description , presence:true , length: {minimum:8, maximum:100}



#Now it inherit from application record & It has all crud functionalities
#We don't have to give different names if the class is User then the model name should be user and table name should be users.

end

