require "uri_config/config"

module DatabaseUrlTools
  class PgConfig < URIConfig::Config
    def database
      path[1..-1]
    end

    config(
      :username,
      :database,
      :host,
      :port,
      :password,
    )
  end

  class Psql
    def initialize(config)
      require 'ostruct'
      @config = OpenStruct.new(config)
    end

    attr_reader :config

    def pgpass
      [
        config.host,
        config.port,
        config.database,
        config.username,
        config.password,
      ].join(":")
    end

    def command
      %W(
        psql
        -h #{config.host}
        -p #{config.port}
        -d #{config.database}
        -U #{config.username}
      )
    end
  end
end
