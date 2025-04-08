# frozen_string_literal: true

xml.rss('version' => '2.0', 'xmlns:dc' => 'http://purl.org/dc/elements/1.1/',
        'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd') do
  xml.channel do
    xml.title 'Practice Rope'
    xml.link 'https://practicerope.bunnymatic.com/'
    xml.description 'Practice Rope'
    xml.language 'en-us'
    xml.ttl '4000'
    xml.pubDate @pub_date.rfc822
    xml.lastBuildDate @last_build_date.rfc822
    xml.itunes :author, 'Practice Rope'
    xml.itunes :explicit, 'clean'
    xml.itunes :image, href: image_url('podcast_image.png')
    xml.itunes :owner do
      xml.itunes :name, 'Practice Rope'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, text: 'Music'
    xml.itunes :summary, 'This is a collection of the ramblings of Brendan and Jenn'

    @tracks.each do |track|
      xml.item do
        xml.title(track.title)
        xml.description(track.description)
        xml.pubDate((track.recorded_on || track.created_at).rfc822)
        xml.guid(track.signed_url)
        xml.link("https://practicerope.bunnymatic.com/#{track_path(track)}")
        xml.enclosure(url: track.signed_url, type: 'audio/mpeg')
        xml.tag!('dc:creator', track.author)
      end
    end
  end
end
