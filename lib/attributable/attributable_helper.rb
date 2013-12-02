module Attributable
  module AttributableHelper
    extend ActiveSupport::Concern

    included do
      has_many :activities, as: :trackable, class_name: "Attributable::Activity"

      # Method returns all activities for trackable
      # in chronological order
      def activities_chronologically
        activities.includes(:user).in_order
      end

      # Convience method that allows for the quick addition
      # of an activity for an trackable object. It is required
      # to pass in an action and user. The note is optional
      def add_activity(action, user, note=nil)
        activities << Attributable::Activity({ action: action, trackable: self, user: user, notes: note })
      end

      # Finds the last activity for the object
      def last_activity
        activities.order("created_at DESC").last.includes(:user)
      end
    end

    # Method returns the class name so that we can use it
    # in other methods to find trackable items
    def self.trackable
      self.base_class.name
    end

    # Finds all activities for an trackable object
    def self.find_activities_for(obj)
      Attributable::Activity.find_activities_for_trackable(trackable, obj.id)
    end

    # Finds all activities for an trackable object type
    # made by a specific user
    def self.find_activities_by_user(user)
      Attributable::Activity.find_activities_by_user(user).where(trackable: trackable)
    end
  end
end
