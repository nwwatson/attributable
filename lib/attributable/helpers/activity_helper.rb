module Attributable
  module Helpers
    module ActivtyHelper
      # Allows for the tracking of items within the activities feed
      def track_user_activity(trackable, user, action = params[:action])
        Activity.create!(action: action, trackable: trackable, user: user)
      end
    end
  end
end