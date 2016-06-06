class CMessagesController < ApplicationController
  before_action :set_c_message, only: [:show, :edit, :update, :destroy]

  # GET /c_messages
  # GET /c_messages.json
  def index
    @c_messages = CMessage.all
  end

  # GET /c_messages/1
  # GET /c_messages/1.json
  def show
  end

  # GET /c_messages/new
  def new
    @c_message = CMessage.new
  end

  # GET /c_messages/1/edit
  def edit
  end

  # POST /c_messages
  # POST /c_messages.json
  def create
    @c_message = CMessage.new(c_message_params)

    respond_to do |format|
      if @c_message.save
        format.html { redirect_to @c_message, notice: 'C message was successfully created.' }
        format.json { render :show, status: :created, location: @c_message }
      else
        format.html { render :new }
        format.json { render json: @c_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c_messages/1
  # PATCH/PUT /c_messages/1.json
  def update
    respond_to do |format|
      if @c_message.update(c_message_params)
        format.html { redirect_to @c_message, notice: 'C message was successfully updated.' }
        format.json { render :show, status: :ok, location: @c_message }
      else
        format.html { render :edit }
        format.json { render json: @c_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c_messages/1
  # DELETE /c_messages/1.json
  def destroy
    @c_message.destroy
    respond_to do |format|
      format.html { redirect_to c_messages_url, notice: 'C message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_message
      @c_message = CMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_message_params
      params.require(:c_message).permit(:text)
    end
end
