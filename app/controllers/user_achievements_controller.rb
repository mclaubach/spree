class UserAchievementsController < ApplicationController
  before_action :set_user_achievement, only: [:show, :edit, :update, :destroy]

  # GET /user_achievements
  # GET /user_achievements.json
  def index
    @user_achievements = UserAchievement.all
  end

  # GET /user_achievements/1
  # GET /user_achievements/1.json
  def show
  end

  # GET /user_achievements/new
  def new
    @user_achievement = UserAchievement.new
  end

  # GET /user_achievements/1/edit
  def edit
  end

  # POST /user_achievements
  # POST /user_achievements.json
  def create
    @user_achievement = UserAchievement.new(user_achievement_params)

    respond_to do |format|
      if @user_achievement.save
        format.html { redirect_to @user_achievement, notice: 'User achievement was successfully created.' }
        format.json { render :show, status: :created, location: @user_achievement }
      else
        format.html { render :new }
        format.json { render json: @user_achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_achievements/1
  # PATCH/PUT /user_achievements/1.json
  def update
    respond_to do |format|
      if @user_achievement.update(user_achievement_params)
        format.html { redirect_to @user_achievement, notice: 'User achievement was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_achievement }
      else
        format.html { render :edit }
        format.json { render json: @user_achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_achievements/1
  # DELETE /user_achievements/1.json
  def destroy
    @user_achievement.destroy
    respond_to do |format|
      format.html { redirect_to user_achievements_url, notice: 'User achievement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_achievement
      @user_achievement = UserAchievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_achievement_params
      params[:user_achievement].permit(:quantity_condition, :type_condition, :name, :id)
    end
end
