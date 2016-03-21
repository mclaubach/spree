require 'test_helper'

class UserAchievementsControllerTest < ActionController::TestCase
  setup do
    @user_achievement = user_achievements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_achievements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_achievement" do
    assert_difference('UserAchievement.count') do
      post :create, user_achievement: {  }
    end

    assert_redirected_to user_achievement_path(assigns(:user_achievement))
  end

  test "should show user_achievement" do
    get :show, id: @user_achievement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_achievement
    assert_response :success
  end

  test "should update user_achievement" do
    patch :update, id: @user_achievement, user_achievement: {  }
    assert_redirected_to user_achievement_path(assigns(:user_achievement))
  end

  test "should destroy user_achievement" do
    assert_difference('UserAchievement.count', -1) do
      delete :destroy, id: @user_achievement
    end

    assert_redirected_to user_achievements_path
  end
end
