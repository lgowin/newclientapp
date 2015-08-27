class Session < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :client
  validates_presence_of :dateservice
  def outstanding_copay
    session.sum(:copayowed)
  end
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |session|
        csv << session.attributes.values_at(*column_names)
      end
    end
  end
end
