class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :destroy, :update]
  def index
    @records = Record.all
  end
  def create
    @record = Record.new(record_params)
    if @record.save
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end
  def update
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end  
  def destroy
    @record.destroy
    head :no_content
  end
  private
  def set_record
    @record = Record.find params[:id]
  end
  def record_params
    params.require(:record).permit(:title, :amount, :date)
  end
end
