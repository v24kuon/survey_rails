require 'rails_helper'

RSpec.describe "surveys/edit", type: :view do
  let(:survey) {
    Survey.create!(
      title: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:survey, survey)
  end

  it "renders the edit survey form" do
    render

    assert_select "form[action=?][method=?]", survey_path(survey), "post" do

      assert_select "input[name=?]", "survey[title]"

      assert_select "textarea[name=?]", "survey[description]"
    end
  end
end
