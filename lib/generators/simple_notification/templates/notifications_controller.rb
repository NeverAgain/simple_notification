class SimpleNotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = SimpleNotification.all
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = SimpleNotification.new(notification_params)
    @notification.save
    redirect_to :back
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = SimpleNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:owner_id, :recipient_id, :trackable_id, :trackable_type, :message, :read)
    end
end
