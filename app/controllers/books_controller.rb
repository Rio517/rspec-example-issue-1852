class BooksController < ApplicationController
  def create
    body = request.body.read
    puts "body: #{body}"
    puts "params: #{params.inspect}"

    if body.present?
      render plain: body, status: 200
    else
      render status: 422
    end
  end
end
