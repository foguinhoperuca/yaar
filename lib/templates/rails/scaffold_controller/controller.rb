<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
<% if !attributes.select { |attr| attr.reference? }.empty? -%>
  before_action :set_dependencies, only: [:new, :edit, :create, :update]
<% end -%>
<% unless options[:singleton] -%>
  def index
    # @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    if !params[:per_page].nil?
      if params[:per_page] != "all"
        per_page = params[:per_page]
      else
        per_page = <%= controller_name.classify.constantize %>.count
      end
    end
    @per_page = per_page || WillPaginate.per_page

    if params[:search].nil? && params[:per_page].nil?
      @<%= plural_table_name %> = <%= controller_name.classify.constantize %>.paginate(page: params[:page], per_page: per_page)
    else
      @<%= plural_table_name %> = <%= controller_name.classify.constantize %>.search(params[:search], params[:page], per_page)
    end
  end
<% end -%>
  def show
	respond_to do |format|
	  format.html { render "layouts/_edit_new_show_form" }
	  format.json { render :show }
	end
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    render "layouts/_edit_new_show_form"
  end

  def edit
    render "layouts/_edit_new_show_form"
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, notice: t('crud.create.message', entity: <%= controller_name.classify.constantize %>.model_name.human) }
        format.json { render :show, status: :created, location: @<%= singular_table_name %> }
      else
        <%- if !attributes.select { |attr| attr.reference? }.empty? -%>
        set_dependencies()
        <%- end -%>
        format.html { render :new }
        format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @<%= singular_table_name %>.update(<%= "#{singular_table_name}_params" %>)
        format.html { redirect_to @<%= singular_table_name %>, notice: t('crud.update.message', entity: <%= controller_name.classify.constantize %>.model_name.human) }
        format.json { render :show, status: :ok, location: @<%= singular_table_name %> }
      else
        <% if !attributes.select { |attr| attr.reference? }.empty? -%>
        set_dependencies()
        <% end -%>
        format.html { render :edit }
        format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
      end
    end      
  end

  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: t('crud.destroy.message', entity: <%= controller_name.classify.constantize %>.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    def <%= "#{singular_table_name}_params" %>
      <% if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <% else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <% end -%>
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
end
<% end -%>
