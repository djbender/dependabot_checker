require 'dotenv/load'
require 'octokit'
require 'concurrent'
require 'concurrent-edge'

begin
require 'byebug'
rescue LoadError
end

require 'dependabot_scanner/version'

module DependabotScanner
  class Core

    DEPENDABOT_PATH = '.github/dependabot.yml'

    attr_reader :client,
      :owner

    def initialize(owner)
      @client = Octokit::Client.new(per_page: 100)
      @client.auto_paginate = true

      @owner = owner.to_s
    end

    def repos_with_dependabot
      dependabot_query.compact
    end

    def repos_without_dependabot
      # byebug
      dependabot_query.select {|_,v| v.nil?}
    end

    private

    def repos
      @repos ||= begin
        client.organization_repositories(owner)
      end
    end

    def dependabot_query
      @dependabot_query ||= begin
        results = {}
        request_pool= Concurrent::Throttle.new 100
        tasks = repos.map do |repo|
          request_pool.future do
            results[repo.full_name] = begin
              client.contents(repo.full_name, path: DEPENDABOT_PATH)
            rescue Octokit::NotFound
              nil
            end
          end
        end
        Concurrent::Promises.zip(*tasks).value!
        results
      end
    end

  end
  class Error < StandardError; end
end
