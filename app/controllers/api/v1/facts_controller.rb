class Api::V1::FactsController < ApplicationController
  before_action :set_fact, only: [:edit, :update, :destroy]
  before_action :fact_paramas, only: [:create, :update]
  def index
    @facts = Fact.all
    render json: @facts
  end

  def show
  end

  def creat
    @fact = Fact.new(fact_paramas)
    if @fact.save
      render json: @fact
    else
      render error: { error: 'unable to  creat User.' }, status: 400
    end
  end

  def update
    if @fact.update(fact_paramas)
      render json: { message: 'succesfuly updated.' }, status: 200
    else
      render error: { error: 'unable to  updated.' }, status: 400
    end
  end

  private

  def set_fact
    @fact = Fact.find(paramas[:id])
    render json: @fact
  end

  def fact_paramas
    params.require(:fact).permit(:fact, :likes, :user_id)
  end
end
