class Collaborator < ActiveRecord::Base
  has_many :comments
  has_many :wikis, through: :comments
end
