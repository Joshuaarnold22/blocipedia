# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  private    :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :collaborators, through: :comments

  def private?
    private == false
  end

  scope :visible_to, -> (user) {
    if !user
      []
    elsif user.role == 'standard'
      where(private: false)
    elsif user.role == 'premium'
      all
    end
  }


end
