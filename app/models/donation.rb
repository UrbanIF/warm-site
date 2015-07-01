# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  amount     :string(255)
#  success    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Donation < ActiveRecord::Base
end
