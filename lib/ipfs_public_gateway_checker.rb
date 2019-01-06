require "ipfs_public_gateway_checker/version"
require "rest-client"
require "parallel"
require 'concurrent-edge'
require "json"

module IpfsPublicGatewayChecker
  HASH_TO_TEST = 'Qmaisz6NMhDB51cCvNWa1GMS7LU1pAxdF4Ld6Ft9kZEP2a'
  HASH_STRING = 'Hello from IPFS Gateway Checker'
  GATEWAY_LIST_URL = 'https://raw.githubusercontent.com/ipfs/public-gateway-checker/master/gateways.json'

  Channel = Concurrent::Channel

  class << self
    # get the possible fastest one
    def get
      list = gateway_list
      return unless list
      ch = Channel.new
      list.each do |url|
        Channel.go do
          test_url = url.sub(':hash', HASH_TO_TEST)
          ch << url if check(test_url)
        end
      end
      ~ch
    end

    # get all active gateway list
    # I've tried to use concurrent-edge to do this parallel detecting but
    # there's always some problem. Perhaps I havn't grasped the gem's usage yet,
    # or due to it's still experimental. Then I use the more robust Parallel gem
    def active_list
      list = gateway_list
      return unless list
      active_gateways = []
      Parallel.map(list, in_threads: list.length) do |url|
        test_url = url.sub(':hash', HASH_TO_TEST)
        active_gateways << url if check(test_url)
      end
      active_gateways&.compact
    end

    def gateway_list
      JSON.parse(RestClient.get(GATEWAY_LIST_URL) || '')
    end

    def check(url, timeout=5)
      begin
        resp = RestClient::Request.execute(method: :get, url: url, timeout: timeout)
      rescue
        return false
      end
      # puts resp.body
      return false unless resp.code == 200
      resp.body&.chomp == HASH_STRING
    end
  end
end
