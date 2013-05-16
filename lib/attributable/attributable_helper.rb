module Attributable
  module AttributableHelper
    extend ActiveSupport::Concern

    included do
      has_many :activities, as: :accountable, class_name: "Attributable::Activity"

      # Method returns all activities for accountable
      # in chronological order
      def activities_chronologically
        activities.in_order
      end

      # Convience method that allows for the quick addition
      # of an activity for an accountable object. It is required
      # to pass in an action and user. The note is optional
      def add_activity(action, user, note=nil)
        activities << Attributable::Activity({ action: action, trackable: self, user: user, notes: note })
      end
    end

    # Method returns the class name so that we can use it
    # in other methods to find accountable items
    def self.accountable
      self.base_class.name
    end

    # Finds all activities for an accountable object
    def self.find_activities_for(obj)
      Attributable::Activity.find_activities_for_accountable(accountable, obj.id)
    end

    # Finds all activities for an accountable object type
    # made by a specific user
    def self.find_activities_by_user(user)
      Attributable::Activity.find_activities_by_user(user).where(accountable_type: accountable)
    end
  end
end
