<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  <%= controller_before_filter %> :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
<%- if !attributes.select { |attr| attr.reference? }.empty? -%>
  <%= controller_before_filter %> :set_dependencies, only: [:new, :edit, :create, :update]
<%- end -%>
  respond_to :html

<% unless options[:singleton] -%>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    respond_with(@<%= plural_table_name %>)
  end
<% end -%>

  def show
    respond_with(@<%= singular_table_name %>)
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_with(@<%= singular_table_name %>)
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, attributes_params) %>
    <%= "flash[:notice] = '#{class_name} was successfully created.' if " if flash? %>@<%= orm_instance.save %>
    respond_with(@<%= singular_table_name %>)
  end

  def update
    <%= "flash[:notice] = '#{class_name} was successfully updated.' if " if flash? %>@<%= orm_instance_update(attributes_params) %>
    respond_with(@<%= singular_table_name %>)
  end

  def destroy
    @<%= orm_instance.destroy %>
    respond_with(@<%= singular_table_name %>)
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

<%-
# FIXME Oh boy! It is worse than PHP!!
  @i = 1
  def print_elsif(attr, size_of)
    result = "params[:#{attr}_id]"
    if size_of != @i
      result = result + " && "
    end
    return result
  end
  # @refs = false
  # attributes.each do |attribute|
  #   @refs = true if attribute.reference?
  # end

  # if @refs
  if !attributes.select { |attr| attr.reference? }.empty?
-%>
    def set_dependencies
      if params[:id]
  <%- attributes.select { |attr| attr.reference? }.each do |attribute| -%>
        @<%= attribute.name.pluralize %> = [].push(@<%= singular_table_name %>.<%= attribute.name %>)
  <%- end -%>
      elsif <%- attributes.each do |attribute| if attribute.reference? %><%= print_elsif(attribute.name, attributes.size) %><%- end; @i = @i + 1 end -%>

  <%- attributes.select { |attr| attr.reference? }.each do |attribute| -%>
        @<%= attribute.name.pluralize %> = [].push(<%= attribute.name.camelize %>.find(params[:<%= attribute.name %>_id]))
  <%- end -%>
  <%- if attributes.select { |attr| attr.reference? }.size > 1 -%>
    <%- attributes.select { |attr| attr.reference? }.each do |attribute| -%>
      elsif params[:<%= attribute.name %>_id]
        @<%= attribute.name.pluralize %> = [].push(<%= attribute.name.camelize %>.find(params[:<%= attribute.name %>_id]))
      <%- attributes.select { |attr| attr.reference? && attr != attribute }.each do |attribute_other| -%>
        @<%= attribute_other.name.pluralize %> = <%= attribute_other.name.camelize %>.all
      <%- end -%>
    <%- end -%>
  <%- end -%>
      else
  <%- attributes.select { |attr| attr.reference? }.each do |attribute| -%>
        @<%= attribute.name.pluralize %> = <%= attribute.name.camelize %>.all
  <%- end -%>
      end
    end
<%- end -%>
    <%- if strong_parameters_defined? -%>

    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
    <%- end -%>
end
<% end -%>
