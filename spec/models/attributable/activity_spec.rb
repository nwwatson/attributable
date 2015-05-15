require 'rails_helper'

RSpec.describe Attributable::Activity, type: :model do
  describe "validations" do
    context "for action" do
      it { should validate_presence_of :action }
    end

    context "for user" do
      it { should validate_presence_of :user }
    end

    context "for trackable" do
      #it { should validate_presence_of :trackable }
    end

    context "for ownable" do
      it {should validate_presence_of :ownable }
    end

    describe "create activity" do
      let(:example_model) {
        ExampleModel.create!(
        title: "this is the title",
        an_integer: 1,
        a_date: Time.now,
        long_text_field: "Hey, this is a long text field.Hey, this is a long text field. Hey, this is a long text field. Hey, this is a long text field"
        )
      }
      let(:user) { User.create(username: 'nwwatson', email: 'nwwatson@gmail.com')}

      context "when provided valid attributes" do
        it "should track changes for a newly created model" do

          @attr = {
            action: "create",
            user: user,
            trackable: example_model
          }

          activity = Attributable::Activity.create!(@attr)

          expect(activity.change_hash.size).to eq(5)
        end
      end

    end


  end
end
