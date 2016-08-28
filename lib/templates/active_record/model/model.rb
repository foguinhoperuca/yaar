<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>

<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>

<% attributes.select { |attr| attr.reference? }.each do |attribute| -%>
  validates :<%= attribute.name %>, presence: true
<% end -%>
end
<% end -%>
