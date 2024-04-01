# DeceptionRouter

DeceptionRouter is a Plug router that will infinitely loop a web crawler, scanners,
and directory fuzzers.

This type of tool is created to aid in cyber deception primarily by wasting time
and resources of an attacker. Moreover, logs to these routes and be an alert
that some is trying to attack your systems.

This is useful to create honey pots in your system or add this to your main
application to keep scanners stuck.

This is inspired by the python library [spidertrap](https://github.com/adhdproject/spidertrap).

## Installation

```elixir
def deps do
  [
    {:deception_router, "~> 1.0"},
  ]
end
```

## Usage

```elixir
defmodule MyApp.Router do

  # routes and stuff

  # At the very bottom
  scope "/" do
   match(:*, "/*", DeceptionRouter, [])
  end
end
```

If you want to target bots as all bots will scan for the an `admin` route you
can do this:

```elixir
defmodule MyApp.Router do

  # routes and stuff

  # At the very bottom
  scope "/" do
   match(:*, "/admin/*sinkhole", DeceptionRouter, [])
  end
end
```

To test in command line:

```
wget -m http://localhost:4000
```

## Future ideas

This should all be runtime configuration items.

- custom word list
- generative text to make content lengths harder to filter on in this tools
- telemetry support
- custom logging
- jitter
- random 404s
