class PagesController < ApplicationController
  before_action :get_input, only: :result
  #before_action :need_only_words, only: :result
  before_action :need_any_numbers, only: :result
  #before_action :need_only_integers, only: :result
  before_action :validate_all, only: :result

  def input
  end

  def get_input
    @input = params[:input]
  end

  def need_only_words #with spaces
    if @input.match(/^[a-zA-Z ]+$/).nil?
      flash[:alert] =
        "Должны быть введены только слова через пробел"
    end
  end

  def need_any_numbers #integers and decimals
    if @input.match(/^([-]?\d+(\.\d+)?)((?:\ ([-]?\d+(\.\d+)?))+)?$/).nil?
      flash[:alert] =
        "Введите положительные/отрицательные целые/вещественные числа через пробел"
    end
  end

  def need_only_integers 
    if @input.match(/^([-]?\d+)((?:\ ([-]?\d+))+)?$/).nil?
      flash[:alert] =
        "Введите положительные/отрицательные целые числа через пробел"
    end
  end

  def validate_all
    redirect_to home_path unless flash.empty?
  end

  def result
    
    @result = @input
  end
end
