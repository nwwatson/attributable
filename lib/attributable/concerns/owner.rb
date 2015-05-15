module Attributable
  module UserHelper
    extend ActiveSupport::Concern

    included do
      has_many :activities, dependent: :destroy, class_name: "Attributable::Activity"
    end

  end
end
