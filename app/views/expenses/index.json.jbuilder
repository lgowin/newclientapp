json.array!(@expenses) do |expense|
  json.extract! expense, :id, :expensedate, :vendor, :expensedesc, :expense
  json.url expense_url(expense, format: :json)
end
