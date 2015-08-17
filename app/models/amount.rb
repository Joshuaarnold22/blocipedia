# == Schema Information
#
# Table name: amounts
#
#  id         :integer          not null, primary key
#  default    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Amount < ActiveRecord::Base
  def regular
    00_01
  end
end
