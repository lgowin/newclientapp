require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @session = sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post :create, session: { claimowed: @session.claimowed, claimpd: @session.claimpd, claimrecvd: @session.claimrecvd, claimsubmit: @session.claimsubmit, client_id: @session.client_id, copayd: @session.copayd, copayowed: @session.copayowed, cptcode: @session.cptcode, dateservice: @session.dateservice, sessionnotes: @session.sessionnotes }
    end

    assert_redirected_to session_path(assigns(:session))
  end

  test "should show session" do
    get :show, id: @session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session
    assert_response :success
  end

  test "should update session" do
    patch :update, id: @session, session: { claimowed: @session.claimowed, claimpd: @session.claimpd, claimrecvd: @session.claimrecvd, claimsubmit: @session.claimsubmit, client_id: @session.client_id, copayd: @session.copayd, copayowed: @session.copayowed, cptcode: @session.cptcode, dateservice: @session.dateservice, sessionnotes: @session.sessionnotes }
    assert_redirected_to session_path(assigns(:session))
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete :destroy, id: @session
    end

    assert_redirected_to sessions_path
  end
end
