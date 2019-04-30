require 'test_helper'

class ServsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serv = servs(:one)
  end

  test "should get index" do
    get servs_url
    assert_response :success
  end

  test "should get new" do
    get new_serv_url
    assert_response :success
  end

  test "should create serv" do
    assert_difference('Serv.count') do
      post servs_url, params: { serv: { book_id: @serv.book_id, finish: @serv.finish, reader_id: @serv.reader_id, start: @serv.start } }
    end

    assert_redirected_to serv_url(Serv.last)
  end

  test "should show serv" do
    get serv_url(@serv)
    assert_response :success
  end

  test "should get edit" do
    get edit_serv_url(@serv)
    assert_response :success
  end

  test "should update serv" do
    patch serv_url(@serv), params: { serv: { book_id: @serv.book_id, finish: @serv.finish, reader_id: @serv.reader_id, start: @serv.start } }
    assert_redirected_to serv_url(@serv)
  end

  test "should destroy serv" do
    assert_difference('Serv.count', -1) do
      delete serv_url(@serv)
    end

    assert_redirected_to servs_url
  end
end
