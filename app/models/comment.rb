# == Schema Information
#
# Table name: comments
#
#  id              :integer          not null, primary key
#  body            :text
#  collaborator_id :integer
#  wiki_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :collaborator
  belongs_to :wiki
end
