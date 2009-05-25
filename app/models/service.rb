class Service < ActiveRecord::Base
  belongs_to :service_comment
  belongs_to :service_type
  belongs_to :client
  acts_as_ferret :field => [:sl_content,:sl_title]
  
  def self.full_text_search(q, options = {})
    return nil if q.nil? or q.strip.blank?
    default_options = {:limit => 10, :page => 1}
    options = default_options.merge options
    options[:offset] = options[:limit] * (options.delete(:page).to_i-1)
    results = self.find_by_contents(q, options)
    #[results.total_hits,results]
  end
  
  def paginate_search(query, options = {})
    page, per_page, total = wp_parse_options(options)
    pager = WillPaginate::Collection.new(page, per_page, total)
    options.merge!(:offset => pager.offset, :limit => per_page)
    result = find_with_ferret(query, options)
    returning WillPaginate::Collection.new(page, per_page, result.total_hits) do |pager|
      pager.replace result
    end
  end

end
