class BMessagesController < ApplicationController
  before_action :set_b_message, only: [:show, :edit, :update, :destroy]

  # GET /b_messages
  # GET /b_messages.json
  def index
    @b_messages = BMessage.all
  end

  # GET /b_messages/1
  # GET /b_messages/1.json
  def show
  end

  # GET /b_messages/new
  def new
    @b_message = BMessage.new
  end

  # GET /b_messages/1/edit
  def edit
  end

  # POST /b_messages
  # POST /b_messages.json
  def create
    @b_message = BMessage.new(b_message_params)

    respond_to do |format|
      if @b_message.save
        format.html { redirect_to @b_message, notice: 'B message was successfully created.' }
        format.json { render :show, status: :created, location: @b_message }
      else
        format.html { render :new }
        format.json { render json: @b_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b_messages/1
  # PATCH/PUT /b_messages/1.json
  def update
    respond_to do |format|
      if @b_message.update(b_message_params)
        format.html { redirect_to @b_message, notice: 'B message was successfully updated.' }
        format.json { render :show, status: :ok, location: @b_message }
      else
        format.html { render :edit }
        format.json { render json: @b_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b_messages/1
  # DELETE /b_messages/1.json
  def destroy
    @b_message.destroy
    respond_to do |format|
      format.html { redirect_to b_messages_url, notice: 'B message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b_message
      @b_message = BMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b_message_params
      params.require(:b_message).permit(:text)
    end
end
