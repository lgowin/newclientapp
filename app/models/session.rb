class Session < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :client
  validates_presence_of :dateservice
  def outstanding_copay
    session.sum(:copayowed)
  end
end
