# frozen_string_literal: true

require "hanami"

module Bookshelf
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: "bookshelf.session",
      secret: settings.session_secret,
      expire_after: 60*60*24*365
    }
    # For both development and production
    config.actions.content_security_policy[:font_src] += " https://fonts.gstatic.com"
  end
end
