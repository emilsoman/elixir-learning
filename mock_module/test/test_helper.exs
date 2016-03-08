ExUnit.start()

defmodule ModuleHelpers do
  def purge(module) do
    :code.purge(module)
    :code.delete(module)
  end

  defmacro mockmodule(module, do: block) do
    quote do
      Code.compiler_options(ignore_module_conflict: true)
      defmodule unquote(module) do
        unquote(block)
      end
      Code.compiler_options(ignore_module_conflict: false)
    end
  end

  defmacro __using__(_opts) do
    quote do
      import ModuleHelpers
    end
  end
end
