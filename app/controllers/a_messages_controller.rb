class AMessagesController < ApplicationController
  before_action :set_a_message, only: [:show, :edit, :update, :destroy]

  # GET /a_messages
  # GET /a_messages.json
  def index
    @a_messages = AMessage.all
  end

  # GET /a_messages/1
  # GET /a_messages/1.json
  def show
  end

  # GET /a_messages/new
  def new
    @a_message = AMessage.new
  end

  # GET /a_messages/1/edit
  def edit
  end

  # POST /a_messages
  # POST /a_messages.json
  def create
    @a_message = AMessage.new(a_message_params)

    respond_to do |format|
      if @a_message.save
        format.html { redirect_to @a_message, notice: 'A message was successfully created.' }
        format.json { render :show, status: :created, location: @a_message }
      else
        format.html { render :new }
        format.json { render json: @a_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a_messages/1
  # PATCH/PUT /a_messages/1.json
  def update
    respond_to do |format|
      if @a_message.update(a_message_params)
        format.html { redirect_to @a_message, notice: 'A message was successfully updated.' }
        format.json { render :show, status: :ok, location: @a_message }
      else
        format.html { render :edit }
        format.json { render json: @a_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a_messages/1
  # DELETE /a_messages/1.json
  def destroy
    @a_message.destroy
    respond_to do |format|
      format.html { redirect_to a_messages_url, notice: 'A message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a_message
      @a_message = AMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a_message_params
      params.require(:a_message).permit(:text)
    end
end
