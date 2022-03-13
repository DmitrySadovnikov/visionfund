class Companies::Fetch
  BASE_URL = 'https://visionfund.com/_next/data/sbg/portfolio.json'

  def call
    body['pageProps']['portfolio_companies']['data'].each do |c|
      Company.find_by(id: c['id']) || Company.create!(
          id: c['id'],
          date: c['date'],
          title: c['title'],
          city: c['city'],
          state: c['state'],
          country: c['country'],
          home_overview: c['home_overview'],
          overview: c['overview'],
          leadership: c['leadership'],
          fund: c['fund']['title'],
          company_status: c['company_status']['title'],
          sector: c['sector']['title'],
          region: c.dig('region', 'title')
        )
      end
  end

  private

  def body
    @body ||= JSON.parse(Curl.get(BASE_URL).body)
  end
end
