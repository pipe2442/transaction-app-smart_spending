module ApplicationHelper
  def grouptotal(group)
    total = 0
    group.spendings.each do |spending|
      total += spending.amount
    end
    total
  end

  def total_expenses(user)
    total = 0
    user.spendings.each do |spending|
      total += spending.amount
    end
    total
  end

  def show_externals(external)
    arr = []
    external.first.spendings.each do |spending|
         arr << spending
    end 
    
    arr
  end

end
