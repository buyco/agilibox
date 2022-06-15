class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Agilibox::ActiveRecordUuidConcern
  include Agilibox::DefaultValuesConcern
  include Agilibox::ModelToS
  include Agilibox::ModelI18n
  include Agilibox::PolymorphicId
end
