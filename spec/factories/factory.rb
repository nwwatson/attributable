FactoryGirl.define do

  factory :user do
    username "testUser"
    email "example@example.com"
  end

  factory :example_model do
    title "this is the title"
    an_integer 1
    a_date Time.now
    long_text_field "Hey, this is a long text field.Hey, this is a long text field. Hey, this is a long text field. Hey, this is a long text field"
  end

end
