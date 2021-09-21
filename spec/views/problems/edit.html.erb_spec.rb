require 'rails_helper'

RSpec.describe "problems/edit", type: :view do
  before(:each) do
    @problem = assign(:problem, Problem.create!(
      title: "MyString",
      source: "MyString",
      code: "MyText"
    ))
  end

  it "renders the edit problem form" do
    render

    assert_select "form[action=?][method=?]", problem_path(@problem), "post" do

      assert_select "input[name=?]", "problem[title]"

      assert_select "input[name=?]", "problem[source]"

      assert_select "textarea[name=?]", "problem[code]"
    end
  end
end
