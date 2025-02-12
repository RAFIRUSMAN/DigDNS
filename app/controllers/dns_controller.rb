class DnsController < ApplicationController
  def index
  end

  def lookup
    domain = params[:domain]
    server = params[:server].presence || "8.8.8.8"
    query_type = params[:query]

    if domain.present?
      command = "dig @#{server} #{domain} #{query_type}"
      stdout, stderr, status = Open3.capture3(command)

      if status.success?
        @result = stdout.strip
      else
        @result = "Error: #{stderr.strip}"
      end
    else
      @result = "Please enter a domain."
    end

    render :index
  end
end
