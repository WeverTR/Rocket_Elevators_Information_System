require 'test_helper'

class GraphsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @graph = graphs(:one)
  end

  test "should get index" do
    get graphs_url
    assert_response :success
  end

  test "should get new" do
    get new_graph_url
    assert_response :success
  end

  test "should create graph" do
    assert_difference('Graph.count') do
      post graphs_url, params: { graph: { query_id: @graph.query_id, time: @graph.time } }
    end

    assert_redirected_to graph_url(Graph.last)
  end

  test "should show graph" do
    get graph_url(@graph)
    assert_response :success
  end

  test "should get edit" do
    get edit_graph_url(@graph)
    assert_response :success
  end

  test "should update graph" do
    patch graph_url(@graph), params: { graph: { query_id: @graph.query_id, time: @graph.time } }
    assert_redirected_to graph_url(@graph)
  end

  test "should destroy graph" do
    assert_difference('Graph.count', -1) do
      delete graph_url(@graph)
    end

    assert_redirected_to graphs_url
  end
end
