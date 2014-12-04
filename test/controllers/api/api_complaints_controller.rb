require_relative "../../test_helper"

class Api::V1::ComplaintsControllerTest < ActionController::TestCase
  def setup
    Complaint.create(company: "Citi Bank")
    Complaint.create(company: "Citi Bank")
    Complaint.create(company: "Washington Mutual")
  end

  def test_it_gets_a_406_response_when_html_format
    assert_raise ActionController::UnknownFormat do
      get :index, format: "html"
    end
  end

  def test_get_show_returns_a_json_data_object
    get :show, id: Complaint.last.id, format: 'json'
    parsed_response = JSON.parse(response.body)

    assert_equal 200, response.status
    assert_equal "Washington Mutual", parsed_response["company"]
  end

  def test_get_index_returns_json_response
    get :index, format: 'json'
    parsed_response = JSON.parse(response.body)

    assert_equal 200, response.status
    assert_equal 3, parsed_response.count
    assert_equal ["Citi Bank", "Citi Bank", "Washington Mutual"], parsed_response.map { |hash| hash["company"]}
  end

  def test_post_creates_a_new_item
    refute Complaint.find_by(company: 'Bank of America')
    post("create", format: 'json',  complaint: {company: 'Bank of America'})

    assert_equal 201, response.status
    assert_equal 'Bank of America', Complaint.last.company
  end
end