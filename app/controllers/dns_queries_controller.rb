require 'open3'

class DnsQueriesController < ApplicationController
  def index
    @queries = DnsQuery.order(created_at: :desc)
  end

  def create
    domain = params[:domain]
    record_type = params[:record_type] || 'A'
    
    output, error, status = Open3.capture3("dig +short #{record_type} #{domain}")

    if status.success?
      result = output.strip
      DnsQuery.create(domain: domain, record_type: record_type, result: result)
      flash[:success] = "DNS query successful!"
    else
      flash[:error] = "Error querying DNS: #{error}"
    end
    
    redirect_to root_path
  end
end
