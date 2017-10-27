module Agilibox::PolymorphicId
  extend ActiveSupport::Concern

  included do
    def self.polymorphic_id_for(relation_name)
      module_src = File.read(__FILE__).split("__END__").last
      module_src = module_src.gsub("relation", relation_name.to_s)
      send :include, eval(module_src)
    end

    def guid
      return nil if new_record?

      "#{self.class.base_class}-#{id}"
    end
  end # included
end # module

# __END__

Module.new do
  def relation_guid
    return nil if relation_type.blank? || relation_id.blank?

    "#{relation_type}-#{relation_id}"
  end

  def relation_guid=(guid)
    if guid.blank?
      self.relation = nil
      return
    end

    type, id      = guid.split("-", 2)
    self.relation = type.constantize.find(id)
  end
end
