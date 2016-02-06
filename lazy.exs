# This is an exercise to learn how quotes work in Elixir, and how
# __before_compile__ can be used to append something into a module
# just before compilation. Run with `elixir lazy.exs`

defmodule Lazy do
  defmacro __using__(_opts) do
    quote do
      Module.register_attribute(__MODULE__, :remember, accumulate: true)
      @before_compile Lazy
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def call_remembered_funcs do
        Enum.each @remember, fn (x) ->
          apply(__MODULE__, x, [])
        end
      end
    end
  end
end

defmodule MyModule do
  use Lazy

  @remember :hello
  @remember :world

  def hello do
    IO.puts "Hello"
  end

  def world do
    IO.puts "World"
  end

end

MyModule.call_remembered_funcs
