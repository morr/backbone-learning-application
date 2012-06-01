# encoding: utf-8

class FlightsController < ApplicationController
  def index
    id = 0
    render json: 1.upto(10).map {
      start_date = DateTime.now + (rand()*400).hours
      finish_date = start_date + (rand()*10).hours
      duration = (finish_date.to_i - start_date.to_i) / 60 / 60
      id += 1
      {
        id: id,
        date: start_date.strftime('%d.%m.%Y'),
        day: start_date.strftime('%A'),
        start_at: start_date.strftime('%H:%M'),
        finish_at: finish_date.strftime('%H:%M'),
        duration: "#{duration} #{Russian.p(duration, 'час', 'часа', 'часов')}",
        from: "Москва Шереметьево (терминал #{['A', 'B', 'C', 'D', 'E', 'F'].sample})",
        to: "Москва Шереметьево (терминал #{['A', 'B', 'C', 'D', 'E', 'F'].sample})",
        plane: "ТУ #{(rand*1000).to_i}",
        num: "UN #{(rand*100).to_i}",
        company: 'company'
      }
    }
  end
end
