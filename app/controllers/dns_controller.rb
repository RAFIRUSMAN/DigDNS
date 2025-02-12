class DnsController < ApplicationController
  def lookup
    domain = params[:domain]
    server = params[:server].present? ? params[:server] : "8.8.8.8" # Default to Google DNS
    query_type = params[:query]

    if domain.present?
      @result = `dig @#{server} #{domain} #{query_type}`
    else
      @result = "No domain provided."
    end

    render :index
  end
end
