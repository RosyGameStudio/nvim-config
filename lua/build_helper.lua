print("Hello!")

local function find_and_run_path(p)
    local found = false
    local search_path = vim.fn.getcwd()
    local max_iterations = 10
    local current_iterations = 0
    local prev_path = ""
    while search_path ~= prev_path do
        prev_path = search_path
        build_path = search_path .. '\\' .. p
        do
            local message = string.format("searching %s", build_path)
            print(message)
        end
        if vim.fn.filereadable(build_path) == 1 then
            local message = string.format("has %s", build_path)
            print(message)
            found = true

            vim.cmd('cd ' .. vim.fn.fnameescape(search_path))
            vim.cmd('!' .. p)

            break
        else
            local message = string.format("nope: %s", build_path)
            print(message)
            found = true
        end
        search_path = vim.fn.fnamemodify(search_path, ':h')
        do
            local message = string.format("new search path: %s", search_path)
            print(message)
        end
	current_iterations = current_iterations + 1
	if current_iterations >= max_iterations then
		break
	end
     end
     if found == false then
         local message = string.format("%s was not found", p)
         print(message)
     end
end

local function run_build()
    print("F5 pressed!")
    find_and_run_path("build.bat")
end

local function run_debug()
    print("Shift F5 pressed!")
    find_and_run_path("debug.bat")
end

vim.keymap.set('n', '<F5>', run_build, { desc = 'Run a build.bat' })
vim.keymap.set('n', '<S-F5>', run_debug, { desc = 'Run a debug.bat' })
