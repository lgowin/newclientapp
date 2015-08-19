class Expense < ActiveRecord::Base

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |expense|
        csv << expense.attributes.values_at(*column_names)
      end
    end
  end
end
