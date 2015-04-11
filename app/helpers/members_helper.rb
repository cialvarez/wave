

module MembersHelper
  def members_tree_for(members)
     members.map do |member, nested_members|
       render(member) +
           (nested_members.size > 0 ? content_tag(:div, members_tree_for(nested_members), class: "recruits") : nil)
     end.join.html_safe
   end
end
