class Article < ApplicationRecord

  #Validations
  validates :title ,presence:true , length: {minimum:6, maximum:18}
  validates :description , presence:true



#Now it inherit from application record & It has all crud functionalities
#We don't have to give different names if the class is User then the model name should be user and table name should be users.

end

