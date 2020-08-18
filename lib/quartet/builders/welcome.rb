# frozen_string_literal: true

module Quartet::Builders
  class Welcome < Quartet::Builders::Builder
    def initialize
      @directory = 'views'
      @file_type = '.erb'
    end

    def build(app_name)
      %(<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>#{app_name}</title>
  <style>
    .msg-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 100vw;
      height: 100vh;
      font-family: arial,sans-serif;
      color: #333;
    }

    .header {
      font-size: 3rem;
      margin-bottom: 1rem;
    }

    .message {
      font-size: 1.2rem;
      margin-top: 0.3rem;
    }
  </style>
</head>
<body>
  <div class="msg-container">
    <h2 class="header">Quartet executed successfully!</h2>
    <h4 class="message">Welcome to #{app_name}</h4>
  </div>åå
</body>
</html>
)
    end
  end
end
