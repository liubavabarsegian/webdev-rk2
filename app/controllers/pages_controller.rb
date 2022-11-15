# frozen_string_literal: true

# class PagesController
class PagesController < ApplicationController
  before_action :read_input, only: :result
  before_action :validate_input, only: :result

  def input; end

  def read_input
    @input = params[:input]
    @arr = @input.split(' ').map!(&:to_f)
  end

  def validate_input
    if @input.match(/^( ?)+(-?\d+(\.\d+)?)((?:\ +(-?\d+(\.\d+)?))+)?(\ +)?$/).nil?
      flash[:alert] =
        'Введите положительные/отрицательные целые/вещественные числа через пробел'
      # #ошибка #{@input.match(/^(-?\d+(\.\d+)?)((?:\ (-?\d+(\.\d+)?))+)?$/)}"
    end
    if @arr.none?(&:positive?)
      flash[:alert] =
        'Введите хотя бы одно положительное число'
    end
    redirect_to home_path unless flash.empty?
  end

  def result
    @counter = @arr.select.with_index { |_el, i| (i % 3).zero? }.size
    @last_positive = @arr.select(&:positive?)[-1]
    @result = @counter.to_f / @last_positive
  end
end
