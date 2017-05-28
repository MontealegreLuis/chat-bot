# Chat bot

[![Build Status](https://travis-ci.org/MontealegreLuis/chat-bot.svg?branch=master)](https://travis-ci.org/MontealegreLuis/chat-bot)
[![Code Climate](https://codeclimate.com/github/MontealegreLuis/chat-bot/badges/gpa.svg)](https://codeclimate.com/github/MontealegreLuis/chat-bot)

Simple chat bot with a command line interface written in Ruby.

## Setup

The bot answers using a `.yml` file. Before using it we need to generate that file.
The following command will generate the yaml file named `fred.bot`.

```bash
$ ruby bot_data_to_yaml.rb fred.bot
```

Install the application dependencies.

```bash
$ bundle install --path .bundle
```

## Usage

Run the following command from your terminal.

```bash
$ ruby app.rb
```

## Tests

To run the specs execute the following command:

```bash
$ bundle exec rspec --format documentation
```

