# Expart

*Ceci n'est pas un HyParView.*

This is not a [HyParView protocol](http://asc.di.fct.unl.pt/~jleitao/pdf/dsn07-leitao.pdf) implementation. Expart is simply a wrapper to [partisan](https://github.com/lasp-lang/partisan).

## But... why?

Well, Partisan is much more flexible and supports more protocols. But Partisan's configuration is quite verbose. It also requires you to create a `GenServer` module to pass as callback for received messages. Sometimes it's pretty useful to simply specify a function as a callback instead of writing a specific module.

Expart wraps that logic away and gives you access to the actual communication API in
a more Elixir friendly manner.

If you need something more complete, I highly recommend [partisan](https://github.com/lasp-lang/partisan). Otherwise you
can take a look at the [examples](/examples).

Expart is a work in progress™. It still doesn't fully support the complete
Partisan API. More to come.
