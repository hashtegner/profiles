require 'shoulda-matchers'

if Shoulda::Matchers::VERSION == '3.1.1'
  Shoulda::Matchers::RailsShim.class_eval do
    def self.serialized_attributes_for(model)
      if defined?(::ActiveRecord::Type::Serialized)
        # Rails 5+
        model.columns.select do |column|
          type_attribute = model.type_for_attribute(column.name)
          type_attribute.is_a?(::ActiveRecord::Type::Serialized)
        end.inject({}) do |hash, column|
          coder = model.type_for_attribute(column.name).coder
          coder = coder.object_class if coder.respond_to?(:object_class)
          hash[column.name.to_s] = coder.name.split('::').last.constantize
          hash
        end
      else
        model.serialized_attributes
      end
    end
  end
else
  raise "Please, remove a Patch from shoulda matchers on file #{__FILE__}"
end
