<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>
<% attributes.select { |attr| attr.reference? }.each do |attribute| -%>
  validates :<%= attribute.name %>, presence: true
<% end -%>
  def self.search_by(search, page, per_page = 10, attr = "number")
    attr = "number" if attr.nil?
    order('number').where(["#{attr} like LOWER(?)", "%#{search}%".mb_chars.downcase]).paginate(page: page, per_page: per_page)
  end
end
<% end -%>
