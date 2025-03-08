local M = {}

function M.objdump(obj)
  for k, v in pairs(obj) do
    print(k, v)
  end
end

return M
