# == Schema Information
#
# Table name: collaborators
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  wiki_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
  has_many :comments

  validates_uniqueness_of :user_id, scope: :wiki_id
end
