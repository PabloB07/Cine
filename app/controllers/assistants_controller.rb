class AssistantsController < ApplicationController
    before_action :set_assistant, only: [:show, :edit, :update, :destroy]

    # GET /assistants
    # GET /assistants.json
    def index
      @assistant = Assistant.all
    end
  
    # GET /assistants/1
    # GET /assistants/1.json
    def show
    end
  
    # GET /assistants/new
    def new
      @assistant = Assistant.new
      # @assistant = @assistant.questions.build
    end
  
    # GET /assistants/1/edit
    def edit
    end
  
    # POST /assistants
    # POST /assistants.json
    def create
      @assistant = Assistant.new(assistant_params)
      # @assistant = Question.create(params[:question])
  
      respond_to do |format|
        if @assistant.save
          format.html { redirect_to @assistant, notice: 'Assistant was successfully created.' }
          format.json { render :show, status: :created, location: @assistant }
        else
          format.html { render :new }
          format.json { render json: @assistant.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /assistants/1
    # PATCH/PUT /assistants/1.json
    def update
      respond_to do |format|
        if @assistant.update(assistant_params)
          format.html { redirect_to @assistant, notice: 'Assistant was successfully updated.' }
          format.json { render :show, status: :ok, location: @assistant }
        else
          format.html { render :edit }
          format.json { render json: @assistant.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /assistants/1
    # DELETE /assistants/1.json
    def destroy
      # byebug
      if @assistant.destroy
        respond_to do |format|
          format.html { redirect_to assistants_url, notice: 'Assistant was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to assistants_url, notice: 'Something went wrong' }
          format.json { head :no_content }
        end
      end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_assistant
      @assistant = Assistant.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def assistant_params
      params.require(:assistant).permit(:name, :message, users_attributes: [:id, :username, :age, :country, :assistants_id])
    end
  end