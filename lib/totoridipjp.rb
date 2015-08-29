# coding: utf-8
require "totoridipjp/version"
require 'net/http'
require 'uri'
require 'json'

module Totoridipjp
  KoyashiIwashi = Struct.new(:response, :url)

  class << self
    def get_iwashi
      url = URI.parse('http://totori.dip.jp/api/topimg/?format=json'.freeze)
      res = Net::HTTP.get_response url
      case res
      when Net::HTTPSuccess
        json = JSON.parse(res.body)
        KoyashiIwashi.new(res, json['url'.freeze])
      else
        KoyashiIwashi.new(res, nil)
      end
    end
    alias イワシがいっぱいだあ…ちょっとだけもらっていこうかな get_iwashi
  end

end
