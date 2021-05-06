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

  def show_avatar(user)
    image = ''
    image << image_tag(user.avatar, style: 'height:150px;width:150px;border-radius:100%;') if user.avatar.attached?
    image.html_safe
  end

  def show_icon(group)
    icon = ''
    icon << image_tag(group.icon, style: 'height:120px;width:120px;border-radius:50%;') if group.icon.attached?
    icon.html_safe
  end
end
