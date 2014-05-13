#require 'rails_admin/config/fields/base'
module RailsAdmin::Config::Fields::Types
  class Uploader < RailsAdmin::Config::Fields::Types::Text
    RailsAdmin::Config::Fields::Types::register(:rails_uploader, self)

    register_instance_option(:config) do
      {}
    end

    register_instance_option(:sortable) do
      true
    end

    register_instance_option(:editable) do
      true
    end

    register_instance_option(:partial) do
      :form_rails_uploader
    end
    
    register_instance_option :allowed_methods do
      @abstract_model.model_name.constantize.fileuploads_options[:save_fileupload_guid] ? [method_name, :fileupload_guid] : [method_name]
    end

    def scope_type
      # Use association name if existent
      if bindings[:form].object_name.scan(/.*\[(.*)_attributes\]/).nil?
        bindings[:form].object_name
      else
        bindings[:form].object_name.scan(/.*\[(.*)_attributes\]/).to_s
      end
    end

    def scope_id
      bindings[:object].id
    end

  end
end
